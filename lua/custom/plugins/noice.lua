return {
  {
    "folke/noice.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  -- NOTE: this will just be in case you setup your colorscheme transparency
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        merge_duplicates = true,
        background_colour = "#000000", -- Setting this to black or any other color you prefer
        timeout = 100,
      })
    end,
  },
}

