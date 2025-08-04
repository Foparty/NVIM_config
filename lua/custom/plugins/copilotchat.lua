return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {

			window = {
				-- layout = "float",
				layout = "vertical",
				-- border = "rounded",
				width = 0.5,
				height = 1,
			},
			-- See Configuration section for options
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "Toggle CopilotChat" },
		},
	},
}
