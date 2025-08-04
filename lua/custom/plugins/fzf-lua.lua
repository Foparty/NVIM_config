return {
	"ibhagwan/fzf-lua",
	enabled = false,
	config = function()
		require("fzf-lua").setup({
			winopts = {
				width = 0.95,
				height = 0.95,
			},
			files = {
				prompt = "Files❯ ",
				cwd_prompt = true,
			},
			grep = {
				prompt = "Grep❯ ",
			},
			buffers = {
				prompt = "Buffers❯ ",
			},
			keymaps = {
				prompt = "Keymaps❯ ",
			},
			help = {
				prompt = "Help❯ ",
			},
		})

		local fzf = require("fzf-lua")

		-- Keymaps
		vim.keymap.set("n", "<leader><leader>", function()
			fzf.files({ cwd = vim.loop.cwd() })
		end, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>,", fzf.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps" })
		vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Grep" })
		vim.keymap.set("n", "<leader>fr", fzf.registers, { desc = "Registers" })
		vim.keymap.set("n", "<leader>fc", function()
			fzf.files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find Config File" })
		vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help" })
		vim.keymap.set("n", "<leader>fn", function()
			fzf.files({ cwd = "~/notes/" })
		end, { desc = "Find Notes" })
		vim.keymap.set("n", "<leader>fm", function()
			fzf.live_grep({ cwd = "~/notes/" })
		end, { desc = "Grep Notes" })
		vim.keymap.set({ "n", "x" }, "<leader>fw", fzf.grep_cword, { desc = "Grep word/selection" })

		-- LSP
		vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "Goto Definition" })
		vim.keymap.set("n", "gD", fzf.lsp_declarations, { desc = "Goto Declaration" })
		vim.keymap.set("n", "grr", fzf.lsp_references, { desc = "References" })
		vim.keymap.set("n", "gI", fzf.lsp_implementations, { desc = "Goto Implementation" })
		vim.keymap.set("n", "gy", fzf.lsp_typedefs, { desc = "Goto Type Definition" })
		vim.keymap.set("n", "gs", fzf.lsp_document_symbols, { desc = "LSP Symbols" })
		vim.keymap.set("n", "<leader>sS", fzf.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })
	end,
}
