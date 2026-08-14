local map = vim.keymap

map.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

map.set("n", ";", ":", { desc = "Enter command mode" })

map.set("i", "kj", "<Esc>:w<CR>", { desc = "Exit insert mode and save file" })
map.set("i", "jj", "<Esc>:w<CR>", { desc = "Exit insert mode and save file" })

map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

map.set("n", "<C-s>", "gg<S-v>G", { desc = "Select all text" })

map.set("n", "n", "nzzzv", { desc = "Next search result and center" })
map.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

map.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page and center" })
map.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page and center" })
map.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll down full page and center" })
map.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll up full page and center" })

map.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down" })
map.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up" })
map.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
map.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

-- NOTE: most probably wont need this when using trouble
map.set("n", "<leader>]", "<cmd>cnext<CR>", { desc = "Go to next quickfix item" })
map.set("n", "<leader>[", "<cmd>cprev<CR>", { desc = "Go to previous quickfix item" })

map.set("n", "<C-right>", "<C-w>>", { desc = "Increase window width" })
map.set("n", "<C-left>", "<C-w><", { desc = "Decrease window width" })
map.set("n", "<C-up>", "<C-w>+", { desc = "Increase window height" })
map.set("n", "<C-down>", "<C-w>-", { desc = "Decrease window height" })

map.set("n", "<leader>e", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic float" })

map.set("n", "<leader>q", ":wqa<CR>", { desc = "Save all and [q]uit" })

map.set("n", "<c-q>", function()
  vim.cmd("close")
end, { desc = "Close split" })

map.set("n", "<up>", function()
  vim.cmd("close")
end, { desc = "Close split" })
map.set("n", "<right>", "<C-w>v", { desc = "Split window vertically" })
map.set("n", "<down>", "<C-w>s", { desc = "Split window horizontally" })
map.set("n", "<left>", ":w!<CR>", { desc = "Save current file" })

map.set("n", "<leader>kb", ":bd!<CR>", { desc = "[K]ill current buffer" })
map.set("n", "<leader>ka", ":%bd<CR>", { desc = "[K]ill [A]ll buffers" })

map.set("n", "<leader>so", ":so %<CR>", { desc = "Source current file" })

map.set("n", "<leader>lz", ":Lazy<CR>")

local function open_or_create_doc(opts)
  local filepath = opts.filepath
  local default_lines = opts.default_lines or { "# New Note" }
  local expanded_filepath = vim.fn.expand(filepath)

  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filepath, ":h"), "p")

  if vim.fn.filereadable(expanded_filepath) == 1 then
    vim.cmd("edit " .. filepath)
  else
    vim.fn.writefile({}, expanded_filepath, "b")
    vim.cmd("edit " .. filepath)
    vim.api.nvim_buf_set_lines(0, 0, -1, true, default_lines)
  end

  vim.cmd("$ | put _ | put _ | startinsert")
end

vim.api.nvim_create_user_command("CreateNewNote", function()
  local filename = vim.fn.input("Enter note name:", "", "file")
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end
  open_or_create_doc({
    filepath = "~/notes/" .. filename,
    default_lines = { "# New Note" },
  })
end, {})

map.set("n", "<leader>nn", ":CreateNewNote<CR>", { noremap = true, silent = true, desc = "[N]ew [N]ote" })

vim.api.nvim_create_user_command("CreateNewMessage", function()
  local filename = vim.fn.input("Enter note name:", "", "file")
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end
  open_or_create_doc({
    filepath = "~/messages/" .. filename,
    default_lines = { "# New Message" },
  })
end, {})

map.set("n", "<leader>nm", ":CreateNewMessage<CR>", { noremap = true, silent = true, desc = "[N]ew [M]essage" })

vim.api.nvim_create_user_command("CreateJournal", function()
  local date = vim.fn.strftime("%d-%m-%Y")
  open_or_create_doc({
    filepath = "~/journal/" .. date .. ".md",
    default_lines = { "# Journal " .. date },
  })
end, {})

map.set("n", "<leader>nj", ":CreateJournal<CR>", { desc = "[N]ew [J]ournal note" })

local function toggle_spell()
  vim.wo.spell = not vim.wo.spell
end

map.set("n", "<leader>S", toggle_spell, { desc = "[S]pell check" })

map.set("n", "<leader>cm", ":Mason<CR>")

map.set("n", "<leader>hn", "<cmd>Noice<cr>", { desc = "Notification History" })
map.set("n", "<leader>hm", "<cmd>messages<cr>", { desc = "Messages History" })

map.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Show hover information" })

map.set({ "n", "v" }, "gu", "~", { noremap = true, silent = true, desc = "Toggle case" })

map.set("n", "<leader>j", ":b#<CR>", { noremap = true, silent = true })
