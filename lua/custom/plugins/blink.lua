-- https://github.com/Saghen/blink.cmp
return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    optional = true,
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      enabled = function()
        return not vim.tbl_contains({ "markdown", "typr" }, vim.bo.filetype)
            and vim.bo.buftype ~= "prompt"
            and vim.b.completion ~= false
      end,
      keymap = {
        preset = "default",
        ["<C-y>"] = { "select_and_accept", "fallback" },
        ["<Tab>"] = { "select_and_accept", "fallback" },
      },
      completion = {
        menu = { border = "rounded", draw = { treesitter = {} } },
        documentation = { window = { border = "rounded" } },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        max_typos = function(keyword)
          return math.floor(#keyword / 4)
        end,
        use_frecency = true,
        use_proximity = true,
        use_unsafe_no_lock = false,
        sorts = {
          "score",
          "sort_text",
        },

        prebuilt_binaries = {
          download = true,

          ignore_version_mismatch = false,

          force_version = nil,

          force_system_triple = nil,

          extra_curl_args = {},
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
