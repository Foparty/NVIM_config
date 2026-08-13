return {
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
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
          "ruby",
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
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
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "SessionLoadPost",
        callback = function()
          vim.schedule(function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_is_loaded(buf) then
                pcall(vim.treesitter.stop, buf)
                pcall(vim.treesitter.start, buf)
              end
            end
          end)
        end,
      })
    end,
  },
}
