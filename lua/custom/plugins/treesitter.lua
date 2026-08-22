return {
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ensure_installed = {
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
        "astro",
        "bash",
        "yaml",
        "diff",
      }

      require("nvim-treesitter").install(ensure_installed)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("NvimTreesitterSetup", { clear = true }),
        callback = function(args)
          local buf = args.buf
          local ok = pcall(vim.treesitter.start, buf)
          if not ok then
            return
          end
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
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
