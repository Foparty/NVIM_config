return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "html",
          "css",
          "scss",
          "json",
          "tsx",
          "javascript",
          "typescript",
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        modules = {},
        sync_install = false,
        ignore_install = {},
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Enter>",
            node_incremental = "<Enter>",
            scope_incremental = false,
            node_decremental = "<Backspace>",
          },
        },
        additional_vim_regex_highlighting = false,
      })
    end,
  },
}
