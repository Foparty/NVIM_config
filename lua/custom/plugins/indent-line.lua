return {
  { -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- enabled = false,
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    --NOTE: in case you want color
    config = function()
      require("ibl").setup()
    end,
  },
}
