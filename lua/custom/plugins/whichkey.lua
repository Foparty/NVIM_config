return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    sort = { "local", "order", "group", "alphanum", "mod" },
  },
  config = function(_, opts)
    require("which-key").setup(opts)
    require("which-key").add({
      { "<leader>c", group = "[C]ode" },
      { "<leader>d", group = "[D]iff / Diagnostics" },
      { "<leader>f", group = "[F]ind" },
      { "<leader>g", group = "[G]it" },
      { "<leader>h", group = "[H]istory" },
      { "<leader>k", group = "[K]ill buffers" },
      { "<leader>n", group = "[N]otes" },
      { "<leader>t", group = "[T]est / Toggle" },
    })
  end,
}
