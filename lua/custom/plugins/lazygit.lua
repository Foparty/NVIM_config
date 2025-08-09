return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  -- config = function()
  --   require("telescope").load_extension("lazygit")
  -- end,
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "[L]azy [Git] open" },
    -- {
    --   "<leader>gf",
    --   "<cmd>LazyGitFilterCurrentFile<cr>",
    --   desc = "Lazy [G]it file [L]og",
    -- },
  },
}
