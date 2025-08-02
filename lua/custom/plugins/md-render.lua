return {
  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    lazy = false,
    ft = "markdown",
    config = function()
      require("markview").setup({
        -- hybrid_modes = { "n", "i" },
        preview = {
          hybrid_modes = { "n", "i" },
        },
      })
      require("markview.extras.checkboxes").setup()
      require("markview.extras.editor").setup({})
      require("markview.extras.headings").setup()
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
