return {
  {
    "janko/vim-test",
    config = function()
      vim.g["test#strategy"] = "neovim" -- Run tests in Neovim terminal
      vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { silent = true })
      vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { silent = true })
    end,
  },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({
        filetype = {
          ruby = "ruby $file",
        },
      })
      vim.keymap.set("n", "<leader>tr", ":RunCode<CR>", { silent = true })
    end,
  },
}
