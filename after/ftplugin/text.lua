vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.cursorline = true
vim.opt_local.spell = true

vim.keymap.set("n", "<Tab>", "]s", { buffer = true })
vim.keymap.set("n", "<S-Tab>", "[s", { buffer = true })
vim.keymap.set("n", "j", "gj", { buffer = true })
vim.keymap.set("n", "k", "gk", { buffer = true })
