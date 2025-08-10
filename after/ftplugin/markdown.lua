-- here will come some options for future markdown settings
vim.opt.wrap = true

vim.opt.linebreak = true  -- Wrap lines at word boundaries
vim.opt.cursorline = true -- Highlight the current line

vim.opt_local.spell = true

vim.keymap.set("n", "<Tab>", "]s")
vim.keymap.set("n", "<S-Tab>", "[s")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
