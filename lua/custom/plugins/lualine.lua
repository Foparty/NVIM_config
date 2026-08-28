return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function words()
        return vim.fn.wordcount().words .. " WC"
      end
      local function time()
        return os.date("%H:%M")
      end

      -- Build from the live aether palette (Omarchy writes opts.colors).
      -- Stock lualine/themes/aether.lua uses yellow for normal mode and editor
      -- bg for the center section; aether's StatusLine / MiniStatusline use blue
      -- and bg_statusline instead — this follows those.
      local function theme()
        local name = vim.g.colors_name
        if name ~= "aether" then
          return name or "auto"
        end

        pcall(function()
          require("aether.colorscheme").invalidate()
        end)
        local c = require("aether.colorscheme").get()
        local body = { bg = c.bg_statusline, fg = c.fg_sidebar }

        return {
          normal = {
            a = { bg = c.blue, fg = c.black, gui = "bold" },
            b = { bg = c.bg_statusline, fg = c.blue },
            c = body,
          },
          insert = {
            a = { bg = c.green, fg = c.black, gui = "bold" },
            b = { bg = c.bg_statusline, fg = c.green },
          },
          visual = {
            a = { bg = c.purple, fg = c.black, gui = "bold" },
            b = { bg = c.bg_statusline, fg = c.purple },
          },
          replace = {
            a = { bg = c.red, fg = c.black, gui = "bold" },
            b = { bg = c.bg_statusline, fg = c.red },
          },
          command = {
            a = { bg = c.yellow, fg = c.black, gui = "bold" },
            b = { bg = c.bg_statusline, fg = c.yellow },
          },
          terminal = {
            a = { bg = c.cyan, fg = c.black, gui = "bold" },
            b = { bg = c.bg_statusline, fg = c.cyan },
          },
          inactive = {
            a = { bg = c.bg_statusline, fg = c.muted },
            b = { bg = c.bg_statusline, fg = c.muted },
            c = { bg = c.bg_statusline, fg = c.muted },
          },
        }
      end

      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = theme,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            { "filename", path = 1 },
            --[["filesize"]]
          },
          lualine_x = {
            --[["encoding",]]
            --[["fileformat",]]
            "filetype",
          },
          lualine_y = {
            --[["progress",  { "location" }]]
          },
          lualine_z = { time },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
}

