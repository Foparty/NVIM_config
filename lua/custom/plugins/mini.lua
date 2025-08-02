return {
	{
		"echasnovski/mini.nvim",
		enabled = true,
		config = function()
			require("mini.surround").setup({})
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.pairs").setup()
			require("mini.splitjoin").setup()
			-- require("mini.diff").setup()
		end,
	},
}

