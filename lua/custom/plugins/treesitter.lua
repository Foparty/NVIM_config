return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"astro",
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
          "typescript"
				},

        auto_install = true,

        highlight = {
          enable = true,
        },

        indent = { enable = true },

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<c-bs>",
					},
				},
			})
		end,
	},
}
