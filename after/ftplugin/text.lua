-- iA Writer–like writing buffer: soft wrap, no chrome, typewriter scroll
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.showbreak = ""
vim.opt_local.cursorline = false
vim.opt_local.spell = true
vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.signcolumn = "no"
vim.opt_local.foldcolumn = "0"
vim.opt_local.list = false
vim.opt_local.scrolloff = 999
vim.opt_local.formatoptions:remove("t")
vim.opt_local.formatoptions:append("n1j")

vim.keymap.set("n", "<Tab>", "]s", { buffer = true, desc = "Next misspelled word" })
vim.keymap.set("n", "<S-Tab>", "[s", { buffer = true, desc = "Previous misspelled word" })
vim.keymap.set("n", "j", "gj", { buffer = true, desc = "Down by display line" })
vim.keymap.set("n", "k", "gk", { buffer = true, desc = "Up by display line" })
