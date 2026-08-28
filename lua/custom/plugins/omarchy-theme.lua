-- Follow Omarchy's staged neovim.lua without installing LazyVim.
-- Reads ~/.local/state/omarchy/current/theme/neovim.lua (Omarchy 4) or the
-- legacy ~/.config/omarchy/current/theme/neovim.lua path, applies the
-- colorscheme on startup, and watches the parent current/ directory via
-- fs_event so theme swaps apply near-instantly.

local FALLBACK_COLORSCHEME = "nightfox"
local DEBOUNCE_MS = 75
local FALLBACK_POLL_MS = 10000

local function theme_candidates()
  return {
    vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua"),
    vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua"),
  }
end

local function resolve_theme_path()
  for _, path in ipairs(theme_candidates()) do
    if vim.uv.fs_stat(path) then
      return path
    end
  end
  return theme_candidates()[1]
end

local function watch_dirs_for(theme_path)
  local dirs = {}
  local seen = {}
  local function add(dir)
    if dir and dir ~= "" and not seen[dir] and vim.uv.fs_stat(dir) then
      seen[dir] = true
      dirs[#dirs + 1] = dir
    end
  end

  if theme_path then
    add(vim.fn.fnamemodify(theme_path, ":h:h")) -- .../current
  end
  add(vim.fn.expand("~/.local/state/omarchy/current"))
  add(vim.fn.expand("~/.config/omarchy/current"))
  return dirs
end

---Parse Omarchy neovim.lua into { plugin, name, opts, colorscheme }.
---Never treats LazyVim as an installable plugin — only reads opts.colorscheme.
local function parse_theme(path)
  local chunk, load_err = loadfile(path)
  if not chunk then
    return nil, load_err
  end

  local ok, spec = pcall(chunk)
  if not ok then
    return nil, spec
  end
  if type(spec) ~= "table" then
    return nil, "neovim.lua did not return a table"
  end

  local parsed = {}
  for _, entry in ipairs(spec) do
    if type(entry) == "table" then
      if entry[1] == "LazyVim/LazyVim" then
        if entry.opts and entry.opts.colorscheme then
          parsed.colorscheme = entry.opts.colorscheme
        end
      elseif entry[1] then
        parsed.plugin = entry[1]
        parsed.name = entry.name
        parsed.opts = entry.opts
        parsed.branch = entry.branch
      end
    end
  end

  local cs = parsed.colorscheme
  if type(cs) ~= "string" and type(cs) ~= "function" then
    return nil, "no colorscheme in neovim.lua"
  end

  return parsed
end

-- LazyVim allows opts.colorscheme to be a string or a function (name provider
-- or inline applicator). Function objects are new on every loadfile, so key
-- function themes off file identity instead of tostring(fn).
local function theme_signature(parsed, st)
  local cs = parsed.colorscheme
  local cs_part
  if type(cs) == "function" then
    cs_part = string.format(
      "fn:%s:%s:%s",
      st and st.size or 0,
      st and st.mtime.sec or 0,
      st and st.mtime.nsec or 0
    )
  else
    cs_part = cs
  end
  return cs_part .. "\0" .. vim.inspect(parsed.opts)
end

local function find_plugin(parsed)
  local Config = require("lazy.core.config")
  local keys = {}
  if parsed.name then
    keys[#keys + 1] = parsed.name
  end
  if parsed.plugin then
    keys[#keys + 1] = parsed.plugin
  end

  for _, key in ipairs(keys) do
    local plugin = Config.plugins[key]
    if plugin then
      return plugin, key
    end
  end

  return nil, keys[1]
end

local TRANSPARENCY_FILE = vim.fn.stdpath("config") .. "/plugin/after/transparency.lua"

-- Colorschemes paint solid backgrounds; re-clear them after each apply (same
-- idea as stock omarchy-nvim hotreload). Source after ColorScheme so plugins
-- that restore bg on that event do not win.
local function apply_transparency()
  if vim.fn.filereadable(TRANSPARENCY_FILE) ~= 1 then
    return
  end
  vim.defer_fn(function()
    pcall(vim.cmd.source, TRANSPARENCY_FILE)
    vim.cmd("redraw!")
  end, 5)
end

local function finish_theme_ui()
  -- Invalidate before ColorScheme so lualine (and other consumers) read the new
  -- palette. Lualine's ColorScheme autocmd is often registered before aether's
  -- cache invalidator, so it would otherwise snapshot the previous theme.
  pcall(function()
    require("aether.colorscheme").invalidate()
  end)
  vim.cmd("redraw!")
  vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
  apply_transparency()
  vim.defer_fn(function()
    if package.loaded["lualine"] then
      pcall(function()
        require("aether.colorscheme").invalidate()
      end)
      require("lualine").setup(require("lualine").get_config())
    end
  end, 15)
end

local function apply_theme(parsed, opts)
  opts = opts or {}
  local colorscheme = parsed.colorscheme
  local Loader = require("lazy.core.loader")
  local plugin = find_plugin(parsed)

  if opts.clear then
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then
      vim.cmd("syntax reset")
    end
    vim.o.background = "dark"
  end

  if plugin and parsed.opts then
    plugin.opts = parsed.opts
    if plugin._ then
      plugin._.cache = nil
    end
  end

  -- Function colorscheme: LazyVim calls it; if it returns a name, load that.
  if type(colorscheme) == "function" then
    local ok, result = pcall(colorscheme)
    if not ok then
      vim.notify("omarchy-theme: " .. tostring(result), vim.log.levels.WARN)
      return
    end
    if type(result) == "string" and result ~= "" then
      Loader.colorscheme(result)
      pcall(vim.cmd.colorscheme, result)
    end
    vim.defer_fn(finish_theme_ui, 5)
    return
  end

  if plugin and plugin._ and plugin._.loaded then
    local plugin_dir = plugin.dir .. "/lua"
    if vim.uv.fs_stat(plugin_dir) then
      require("lazy.core.util").walkmods(plugin_dir, function(modname)
        package.loaded[modname] = nil
        package.preload[modname] = nil
      end)
    end
    Loader.reload(plugin)
  else
    Loader.colorscheme(colorscheme)
  end

  vim.defer_fn(function()
    pcall(vim.cmd.colorscheme, colorscheme)
    finish_theme_ui()
  end, 5)
end

local function apply_fallback()
  local Loader = require("lazy.core.loader")
  Loader.colorscheme(FALLBACK_COLORSCHEME)
  pcall(vim.cmd.colorscheme, FALLBACK_COLORSCHEME)
  finish_theme_ui()
end

local function stat_eq(a, b)
  return a
    and b
    and a.size == b.size
    and a.mtime.sec == b.mtime.sec
    and a.mtime.nsec == b.mtime.nsec
end

return {
  {
    name = "omarchy-theme",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    priority = 1000,
    config = function()
      local path = resolve_theme_path()
      local last_stat = vim.uv.fs_stat(path)
      local last_signature = nil
      local applied_fallback = false
      local debounce_timer = nil

      local function sync(clear)
        path = resolve_theme_path()
        local st = vim.uv.fs_stat(path)
        if not st then
          if not applied_fallback then
            apply_fallback()
            applied_fallback = true
            last_signature = nil
          end
          return
        end

        local parsed, err = parse_theme(path)
        if not parsed then
          if not applied_fallback then
            apply_fallback()
            applied_fallback = true
            last_signature = nil
          end
          vim.notify("omarchy-theme: " .. tostring(err), vim.log.levels.WARN)
          return
        end

        local signature = theme_signature(parsed, st)
        if last_signature == signature then
          last_stat = st
          return
        end

        apply_theme(parsed, { clear = clear })
        last_stat = st
        last_signature = signature
        applied_fallback = false
      end

      local function schedule_sync(clear)
        if debounce_timer then
          debounce_timer:stop()
          debounce_timer:close()
          debounce_timer = nil
        end

        debounce_timer = vim.uv.new_timer()
        if not debounce_timer then
          vim.schedule(function()
            sync(clear)
          end)
          return
        end

        debounce_timer:start(
          DEBOUNCE_MS,
          0,
          vim.schedule_wrap(function()
            if debounce_timer then
              debounce_timer:stop()
              debounce_timer:close()
              debounce_timer = nil
            end
            sync(clear)
          end)
        )
      end

      -- Initial apply after lazy has registered plugin specs
      vim.schedule(function()
        sync(false)
      end)

      local watching = false
      for _, dir in ipairs(watch_dirs_for(path)) do
        local handle = vim.uv.new_fs_event()
        if handle then
          -- libuv returns 0 on success (falsy in Lua), so compare explicitly
          local ret = handle:start(dir, {}, function(err)
            if err then
              return
            end
            -- Hop to main loop before touching Lua state / timers
            vim.schedule(function()
              schedule_sync(last_signature ~= nil)
            end)
          end)
          if ret == 0 then
            watching = true
          else
            handle:close()
          end
        end
      end

      -- Slow backup poll only when fs_event could not be started
      if not watching then
        local timer = vim.uv.new_timer()
        if timer then
          timer:start(
            FALLBACK_POLL_MS,
            FALLBACK_POLL_MS,
            vim.schedule_wrap(function()
              path = resolve_theme_path()
              local st = vim.uv.fs_stat(path)
              if not st then
                return
              end
              if last_stat and stat_eq(last_stat, st) then
                return
              end
              local clear = last_signature ~= nil
              last_stat = st
              schedule_sync(clear)
            end)
          )
        end
      end
    end,
  },
}
