return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Sets the loading event to 'VimEnter'
  opts = {
    preset = "modern",
      sort = {
        by = "key", -- Can be "key" or "value"
        order = "asc", -- Can be "asc" or "desc"
      },
  },

  -- config = function()
  --   require("which-key").add({
  --     { "<leader>c", group = "[C]ode stuff" },
  --     { "<leader>d", group = "[D]iagnostics" },
  --     { "<leader>f", group = "[F]ind / Search options" },
  --     { "<leader>g", group = "[G]it stuff" },
  --     { "<leader>h", group = "[H] more Git stuff" },
  --     { "<leader>k", group = "[H] more Git stuff" },
  --     { "<leader>l", group = "[L] Git / Sessions" },
  --     { "<leader>n", group = "[N]ew note or file" },
  --     { "<leader>s", group = "[S]ubstitute R / SSymbols" },
  --   })
  -- end

}

