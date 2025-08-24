local map = vim.keymap

map.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

map.set("n", ";", ":", { desc = "Clear search highlight" })

map.set("i", "kj", "<Esc>:w<CR>", { desc = "Exit insert mode and save file" })
map.set("i", "jj", "<Esc>:w<CR>", { desc = "Exit insert mode and save file" })

map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

map.set("n", "<C-s>", "gg<S-v>G", { desc = "Select all text" })
map.set("n", "<leader>rf", vim.lsp.buf.format, { desc = "[R]e[F]ormat buffer" })

map.set("n", "n", "nzzzv", { desc = "Next search result and center" })
map.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })
map.set("n", "j", "jzzzv", { desc = "j centeker" })
map.set("n", "k", "kzzzv", { desc = "k center" })
map.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page and center" })
map.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page and center" })
map.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll down full page and center" })
map.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll up full page and center" })

map.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down" })
map.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up" })
map.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })
map.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines up" })

-- NOTE: most probably wont need this when using trouble
map.set("n", "<leader>]", "<cmd>cnext<CR>", { desc = "Go to next quickfix item" })
map.set("n", "<leader>[", "<cmd>cprev<CR>", { desc = "Go to previous quickfix item" })

-- map.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
-- map.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
-- map.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
-- map.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

map.set("n", "D", function()
  vim.diagnostic.open_float()
end, { desc = "diagnostic hover" })

map.set("n", "<leader>q", ":qa!<CR>", { desc = "Save all and [q]uit" })

map.set("n", "<c-q>", function()
  vim.cmd("close") -- Save changes (if any)
end, { desc = "Close split or open file explorer if last window" })

map.set("n", "<up>", function()
  local win_count = vim.fn.winnr("$") -- Get the total number of windows
  if win_count > 1 then
    vim.cmd("write")                 -- Save changes (if any)
    pcall(vim.cmd, "close")          -- Safely close the current window (ignore errors)
  else
    vim.cmd("write")                 -- Save changes (if any)
  end
end, { desc = "Close split or open file explorer if last window" })
map.set("n", "<right>", "<C-w>v", { desc = "Split window vertically" })
map.set("n", "<down>", "<C-w>s", { desc = "Split window horizontally" })
map.set("n", "<left>", ":w!<CR>", { desc = "Save current file" }) -- Note: This command seems incorrect, should be ":w<CR>"

map.set("n", "<leader>kb", ":bd!<CR>", { desc = "[K]ill current buffer" })
map.set("n", "<leader>ka", ":%bd<CR>", { desc = "[K]ill [A]ll buffers" })

map.set("n", "<leader>so", ":so %<CR>", { desc = "Source current file" })

map.set("n", "<leader>lz", ":Lazy<CR>")

-- NOTE: here goes custom mappins for creating new external documents
vim.api.nvim_create_user_command("CreateNewNote", function()
  -- Prompt for a custom filename
  local filename = vim.fn.input("Enter note name:", "", "file")

  -- Ensure the filename has a .md extension
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end

  local filepath = "~/notes/" .. filename
  local expanded_filepath = vim.fn.expand(filepath)

  -- Ensure directory exists
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filepath, ":h"), "p")

  -- Check if file exists
  if vim.fn.filereadable(expanded_filepath) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filepath)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, expanded_filepath, "b")
    vim.cmd("edit " .. filepath)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "# New Note" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | put _ | put _ | startinsert")
end, {})

map.set("n", "<leader>nn", ":CreateNewNote<CR>", { noremap = true, silent = true, desc = "[N]ew [N]ote" })

-- NOTE: create new message
vim.api.nvim_create_user_command("CreateNewMessage", function()
  -- Prompt for a custom filename
  local filename = vim.fn.input("Enter note name:", "", "file")

  -- Ensure the filename has a .md extension
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end

  local filepath = "~/messages/" .. filename
  local expanded_filepath = vim.fn.expand(filepath)

  -- Ensure directory exists
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filepath, ":h"), "p")

  -- Check if file exists
  if vim.fn.filereadable(expanded_filepath) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filepath)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, expanded_filepath, "b")
    vim.cmd("edit " .. filepath)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "# New Note" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | put _ | put _ | startinsert")
end, {})

map.set("n", "<leader>nm", ":CreateNewMessage<CR>", { noremap = true, silent = true, desc = "[N]ew [M]essage" })
-- journal one
vim.api.nvim_create_user_command("CreateJournal", function()
  local filename = "~/journal/" .. vim.fn.strftime("%d-%m-%Y") .. ".md"
  local expanded_filename = vim.fn.expand(filename)

  -- Ensure directory exists
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filename, ":h"), "p")

  -- Check if file exists
  if vim.fn.filereadable(expanded_filename) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filename)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, expanded_filename, "b")
    vim.cmd("edit " .. filename)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "# New Note" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | put _ | put _ | startinsert")
end, {})

map.set("n", "<leader>nj", ":CreateJournal<CR>", { desc = "[N]ew [J]ournal note" })

local function toggle_spell()
  vim.wo.spell = not vim.wo.spell -- Toggle spell checking for the current window
end

map.set("n", "<leader>S", toggle_spell, { desc = "[S]pell check" })

map.set("n", "cd", vim.lsp.buf.rename, { desc = "[c]hange [d]efinition" })

map.set("n", "<leader>cm", ":Mason<CR>")

-- map.set("n", "<leader>.", "<cmd>Noice<cr>", { desc = "Notification History" })
map.set("n", "<leader>hn", "<cmd>Noice<cr>", { desc = "Notification History" })
map.set("n", "<leader>hm", "<cmd>messages<cr>", { desc = "Messages History" })
-- State variable to store the last buffer number
local last_buffer = nil

map.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Show hover information" })

map.set({ "n", "v" }, "gu", "~", { noremap = true, silent = true, desc = "Toggle case" })

-- terminal stuff

-- map.set("n", "<leader>tt", function()
-- 	vim.cmd.vnew()
-- 	vim.cmd.term()
-- 	vim.cmd.wincmd("J")
-- 	vim.api.nvim_win_set_height(0, 10)
-- end, { desc = "Toggle terminal" })
map.set("n", "<leader>j", ":b#<CR>", { noremap = true, silent = true })
