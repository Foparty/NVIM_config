-- local Snacks = require("snacks")
return {
	-- lazy.nvim
	{
		"folke/snacks.nvim",
		enabled = true,
		---@type snacks.Config
		opts = {
			-- ui_select = true,
			explorer = {
				replace_netrw = true,
			},
			-- notify = { enabled = true },
			-- notifier = { enabled = true },
			-- terminal = { enabled = true },
			picker = {
				enabled = false,
				layout = {
					-- fullscreen = true,
					cycle = false,
					layout = {
						width = 0.95,
						height = 0.95,
					},
				},
				matcher = {
					frecency = true,
				},
				sources = {
					explorer = {
						-- hidden = true,
						-- ignored = true,
						-- exclude = { ".git" },
						auto_close = false,
						layout = {
							layout = {
								width = 0.2,
								height = 1,
							},
							fullscreen = false,
						},
					},
					lsp_symbols = {
						focus = "list",
					},

					buffers = {
						focus = "list",
					},
				},
			},
		},
		keys = {
			{
				"<C-e>",
				function()
					Snacks.explorer()
				end,
				desc = "Explorer Toggle",
			},
		},
		-- keys = {
		--
		-- 	{
		-- 		"<C-e>",
		-- 		function()
		-- 			Snacks.explorer()
		-- 		end,
		-- 		desc = "Explorer Toggle",
		-- 	},
		-- 	{
		-- 		"<leader><leader>",
		-- 		function()
		-- 			Snacks.picker.smart({
		-- 				finders = { "files" },
		-- 				filter = { cwd = true },
		-- 			})
		-- 		end,
		-- 		desc = "Find Files",
		-- 	},
		-- 	-- {
		-- 	--   "<leader>ff",
		-- 	--   function()
		-- 	--     Snacks.picker.files()
		-- 	--   end,
		-- 	--   desc = "Find files",
		-- 	-- },
		-- 	{
		-- 		"<leader>gb",
		-- 		function()
		-- 			Snacks.picker.git_branches()
		-- 		end,
		-- 		desc = "Git Branches",
		-- 	},
		-- 	{
		-- 		"<leader>gl",
		-- 		function()
		-- 			Snacks.picker.git_log()
		-- 		end,
		-- 		desc = "Git Log",
		-- 	},
		-- 	{
		-- 		"<leader>gd",
		-- 		function()
		-- 			Snacks.picker.git_diff()
		-- 		end,
		-- 		desc = "Git Diff (Hunks)",
		-- 	},
		-- 	{
		-- 		"<leader>gF",
		-- 		function()
		-- 			Snacks.picker.git_log_file()
		-- 		end,
		-- 		desc = "Git Log File",
		-- 	},
		-- 	{
		-- 		"<leader>gs",
		-- 		function()
		-- 			Snacks.picker.git_status()
		-- 		end,
		-- 		desc = "Git Status",
		-- 	},
		-- 	{
		-- 		"<leader>gL",
		-- 		function()
		-- 			Snacks.picker.git_log_line()
		-- 		end,
		-- 		desc = "Git Log Line",
		-- 	},
		-- 	{
		-- 		"<leader>.",
		-- 		function()
		-- 			Snacks.picker.notifications()
		-- 		end,
		-- 		desc = "Notification History",
		-- 	},
		-- 	{
		-- 		"<leader>,",
		-- 		function()
		-- 			Snacks.picker.buffers()
		-- 		end,
		-- 		desc = "Buffers",
		-- 	},
		-- 	{
		-- 		"<leader>fk",
		-- 		function()
		-- 			Snacks.picker.keymaps()
		-- 		end,
		-- 		desc = "Keymaps",
		-- 	},
		-- 	{
		-- 		"<leader>/",
		-- 		function()
		-- 			Snacks.picker.grep()
		-- 		end,
		-- 		desc = "Grep",
		-- 	},
		--
		-- 	{
		-- 		"<leader>fr",
		-- 		function()
		-- 			Snacks.picker.registers()
		-- 		end,
		-- 		desc = "Grep",
		-- 	},
		-- 	-- {
		-- 	--   "<C-/>",
		-- 	--   function()
		-- 	--     Snacks.terminal()
		-- 	--   end,
		-- 	-- },
		-- 	{
		-- 		"<leader>fc",
		-- 		function()
		-- 			Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		-- 		end,
		-- 		desc = "Find Config File",
		-- 	},
		--
		-- 	{
		-- 		"<leader>fh",
		-- 		function()
		-- 			Snacks.picker.help()
		-- 		end,
		-- 		desc = "Help",
		-- 	},
		-- 	{
		-- 		"<leader>fn",
		-- 		function()
		-- 			Snacks.picker.files({ cwd = "~/notes/" })
		-- 		end,
		-- 		desc = "Find Notes",
		-- 	},
		-- 	{
		-- 		"<leader>fm",
		-- 		function()
		-- 			Snacks.picker.grep({ cwd = "~/notes/" })
		-- 		end,
		-- 		desc = "Grep Notes",
		-- 	},
		--
		-- 	{
		-- 		"<leader>fw",
		-- 		function()
		-- 			Snacks.picker.grep_word()
		-- 		end,
		-- 		desc = "Visual selection or word",
		-- 		mode = { "n", "x" },
		-- 	},
		-- 	--lsp
		--
		-- 	{
		-- 		"gd",
		-- 		function()
		-- 			Snacks.picker.lsp_definitions()
		-- 		end,
		-- 		desc = "Goto Definition",
		-- 	},
		-- 	{
		-- 		"gD",
		-- 		function()
		-- 			Snacks.picker.lsp_declarations()
		-- 		end,
		-- 		desc = "Goto Declaration",
		-- 	},
		-- 	{
		-- 		"gr",
		-- 		function()
		-- 			Snacks.picker.lsp_references()
		-- 		end,
		-- 		nowait = true,
		-- 		desc = "References",
		-- 	},
		-- 	{
		-- 		"gI",
		-- 		function()
		-- 			Snacks.picker.lsp_implementations()
		-- 		end,
		-- 		desc = "Goto Implementation",
		-- 	},
		-- 	{
		-- 		"gy",
		-- 		function()
		-- 			Snacks.picker.lsp_type_definitions()
		-- 		end,
		-- 		desc = "Goto T[y]pe Definition",
		-- 	},
		-- 	{
		-- 		"gS",
		-- 		function()
		-- 			Snacks.picker.lsp_symbols()
		-- 		end,
		-- 		desc = "LSP Symbols",
		-- 	},
		-- 	{
		-- 		"gs",
		-- 		function()
		-- 			Snacks.picker.lsp_workspace_symbols()
		-- 		end,
		-- 		desc = "LSP Workspace Symbols",
		-- 	},
		-- 	{
		-- 		"<leader>sd",
		-- 		function()
		-- 			Snacks.picker.diagnostics()
		-- 		end,
		-- 		desc = "Diagnostics",
		-- 	},
		-- 	{
		-- 		"<leader>sm",
		-- 		function()
		-- 			Snacks.picker.marks()
		-- 		end,
		-- 		desc = "Marks",
		-- 	},
		-- 	{
		-- 		"<leader>su",
		-- 		function()
		-- 			Snacks.picker.undo()
		-- 		end,
		-- 		desc = "Undo History",
		-- 	},
		-- },
	},
}
