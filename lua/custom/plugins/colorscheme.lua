return {
	{
		"EdenEast/nightfox.nvim",

		priority = 1000,
		opts = {
			options = {
				transparent = false,
			},
		},
	},
	{
		-- https://github.com/catppuccin/nvim
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		-- https://github.com/folke/tokyonight.nvim
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = false,
			})
		end,
	},
	{
		-- https://github.com/zenbones-theme/zenbones.nvim
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.zenbones = {
				transparent_background = true,
				italic_comments = true,
				-- Options: 'zenbones', 'zenwritten', 'zenburned', 'nordbones', 'forestbones', 'tokyobones', 'rosenones', 'vimbones', 'neobones', 'seoulbones' or 'duckbones'
				variant = "zenbones",
			}
		end,
	},
	{
		-- https://github.com/projekt0n/github-nvim-theme
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		config = function()
			require("github-theme").setup({
				options = {
					transparent = false,
				},
			})
		end,
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,
	},
	{
		"datsfilipe/vesper.nvim",
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {
			transparent = true,
		},
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
}
