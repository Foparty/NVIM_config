vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

local o = vim.opt

vim.schedule(function()
  o.clipboard = "unnamedplus"
end)

o.number = true
o.relativenumber = true
o.wrap = false

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.mouse = "a"
o.showmode = false
o.conceallevel = 1

o.undofile = true
o.breakindent = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.updatetime = 250
o.timeoutlen = 300
o.splitright = true
o.splitbelow = true
o.termguicolors = true
o.background = "dark"
o.backspace = "indent,eol,start"

o.inccommand = "split"
o.cursorline = true
o.scrolloff = 10

o.spelllang = { "es" }
-- vim.opt.spell = true
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

vim.opt.signcolumn = "yes"
o.winborder = "rounded"

-- Folding settings

o.foldmethod = "expr"                          -- Use expression-based folding
o.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use Tree-sitter for fold expressions
o.foldlevel = 99                               -- Start with all folds open (high foldlevel)
o.foldlevelstart = 99                          -- Apply to new buffers
o.foldenable = true                            -- Enable folding
o.foldcolumn = "0"                             -- Show fold column for indicators

o.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
vim.diagnostic.config({
  virtual_text = true, -- Show inline error messages
  signs = true,       -- Show signs in the gutter
  float = {           -- Configure hover/floating window
    border = "rounded",
    source = true,    -- Show source of diagnostic
    focusable = false,
  },
})
