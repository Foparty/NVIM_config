return {
	"ibhagwan/fzf-lua",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local actions = require("fzf-lua").actions
		require("fzf-lua").setup({
			keymap = {
				builtin = {
					["<c-d>"] = "preview-page-down", -- Keep default
					["<c-u>"] = "preview-page-up", -- Keep default
					["<M-Esc>"] = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
					["<F1>"] = "toggle-help",
					["<F2>"] = "toggle-fullscreen",
					-- Only valid with the 'builtin' previewer
					["<F3>"] = "toggle-preview-wrap",
					["<F4>"] = "toggle-preview",
					-- Rotate preview clockwise/counter-clockwise
					["<F5>"] = "toggle-preview-ccw",
					["<F6>"] = "toggle-preview-cw",
					-- `ts-ctx` binds require `nvim-treesitter-context`
					["<F7>"] = "toggle-preview-ts-ctx",
					["<F8>"] = "preview-ts-ctx-dec",
					["<F9>"] = "preview-ts-ctx-inc",
					["<S-Left>"] = "preview-reset",
					["<M-S-down>"] = "preview-down",
					["<M-S-up>"] = "preview-up",
				},
				fzf = {
					["tab"] = "toggle",
					["ctrl-a"] = "toggle-all",
					["ctrl-z"] = "abort",
					["ctrl-u"] = "unix-line-discard",
					["ctrl-f"] = "half-page-down",
					["ctrl-b"] = "half-page-up",
					["alt-a"] = "beginning-of-line",
					["ctrl-e"] = "end-of-line",
					["alt-g"] = "first",
					["alt-G"] = "last",
					-- Only valid with fzf previewers (bat/cat/git/etc)
					["f3"] = "toggle-preview-wrap",
					["f4"] = "toggle-preview",
					["shift-down"] = "preview-page-down",
					["shift-up"] = "preview-page-up",
				},
			},
			winopts = {
				width = 0.95, -- Override default
				height = 0.95, -- Override default
			},
			actions = {
				files = {
					["ctrl-q"] = actions.file_sel_to_qf,
					["enter"] = actions.file_edit_or_qf,
					["ctrl-s"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
					["ctrl-t"] = actions.file_tabedit,
					["alt-Q"] = actions.file_sel_to_ll,
					["alt-i"] = actions.toggle_ignore,
					["alt-h"] = actions.toggle_hidden,
					["alt-f"] = actions.toggle_follow,
				},
			},
		})
	end,

	keys = {
		{
			"<leader><leader>",
			function()
				require("fzf-lua").files({ cwd_only = true })
			end,
			desc = "files in cwd",
		},
		-- TODO: make it to use doccument symbols
		-- {
		--   "<leader>.",
		--   function()
		--     require("fzf-lua").lsp_document_symbols()
		--   end,
		--   desc = "document symbols",
		-- },
		{
			"<leader>.",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "document symbols",
		},
		{
			"<leader>,",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "open buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").live_grep({ cwd_only = true })
			end,
			desc = "grep cwd",
		},
		{
			"<leader>w",
			function()
				require("fzf-lua").grep_cword({ cwd_only = true, prompt = "current WORD" })
			end,
			desc = "grep cwd",
		},
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "files in cwd",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "files in cwd",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "help",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "keymaps",
		},
		{
			"<leader>gf",
			function()
				require("fzf-lua").git_bcommits()
			end,
			desc = "buffer commits",
		},
		{
			"<leader>gb",
			function()
				require("fzf-lua").git_branches()
			end,
			desc = "branches",
		},
		{
			"gs",
			function()
				require("fzf-lua").lsp_workspace_symbols()
			end,
			desc = "project symbols",
		},
		{
			"<leader>dl",
			function()
				require("fzf-lua").diagnostics_workspace()
			end,
			desc = "diagnostics",
		},
		{
			"gd",
			function()
				require("fzf-lua").lsp_definitions()
			end,
			desc = "go to definition",
		},
		{
			"gD",
			function()
				require("fzf-lua").lsp_declarations()
			end,
			desc = "references",
		},
		{
			"gy",
			function()
				require("fzf-lua").lsp_typedefs()
			end,
			desc = "type definitions",
		},
		{
			"gi",
			function()
				require("fzf-lua").lsp_implementations()
			end,
			desc = "implementations",
		},
		{
			"g.",
			function()
				require("fzf-lua").lsp_code_actions()
			end,
			desc = "code actions",
		},
		{
			"gm",
			function()
				require("fzf-lua").marks()
			end,
			desc = "marks",
		},
		{
			"<leader>sc",
			function()
				require("fzf-lua").changes()
			end,
			desc = "changes",
		},

		{
			"<leader>fr",
			function()
				require("fzf-lua").registers()
			end,
			desc = "registers",
		},
		{
			"<leader>ss",
			function()
				require("fzf-lua").spellcheck()
			end,
			desc = "spellcheck",
		},
		{
			"z=",
			function()
				require("fzf-lua").spell_suggest()
			end,
			desc = "spellcheck",
		},
	},
	-- config = function()
	--   require("fzf-lua").setup({
	--     winopts = {
	--       width = 0.95,
	--       height = 0.95,
	--     },
	--     files = {
	--       prompt = "Files❯ ",
	--       cwd_prompt = true,
	--     },
	--     grep = {
	--       prompt = "Grep❯ ",
	--     },
	--     buffers = {
	--       prompt = "Buffers❯ ",
	--     },
	--     keymaps = {
	--       prompt = "Keymaps❯ ",
	--     },
	--     help = {
	--       prompt = "Help❯ ",
	--     },
	--   })
	--
	--
	--   -- Keymaps
	--   vim.keymap.set("n", "<leader><leader>", function()
	--     fzf.files({ cwd = vim.loop.cwd() })
	--   end, { desc = "Find Files" })
	--   vim.keymap.set("n", "<leader>,", fzf.buffers, { desc = "Buffers" })
	--   vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps" })
	--   vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Grep" })
	--   vim.keymap.set("n", "<leader>fr", fzf.registers, { desc = "Registers" })
	--   vim.keymap.set("n", "<leader>fc", function()
	--     fzf.files({ cwd = vim.fn.stdpath("config") })
	--   end, { desc = "Find Config File" })
	--   vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help" })
	--   vim.keymap.set("n", "<leader>fn", function()
	--     fzf.files({ cwd = "~/notes/" })
	--   end, { desc = "Find Notes" })
	--   vim.keymap.set("n", "<leader>fm", function()
	--     fzf.live_grep({ cwd = "~/notes/" })
	--   end, { desc = "Grep Notes" })
	--   vim.keymap.set({ "n", "x" }, "<leader>fw", fzf.grep_cword, { desc = "Grep word/selection" })
	--
	--   -- LSP
	--   vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "Goto Definition" })
	--   vim.keymap.set("n", "gD", fzf.lsp_declarations, { desc = "Goto Declaration" })
	--   vim.keymap.set("n", "grr", fzf.lsp_references, { desc = "References" })
	--   vim.keymap.set("n", "gI", fzf.lsp_implementations, { desc = "Goto Implementation" })
	--   vim.keymap.set("n", "gy", fzf.lsp_typedefs, { desc = "Goto Type Definition" })
	--   vim.keymap.set("n", "gs", fzf.lsp_document_symbols, { desc = "LSP Symbols" })
	--   vim.keymap.set("n", "<leader>sS", fzf.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })
	-- end,
}
