return {
  {
    "nvzone/typr",
    dependencies = { "nvzone/volt" },
    opts = {},
    cmd = { "Typr", "TyprStats" },
    keys = {
      { "<leader>tp", "<cmd>Typr<cr>", desc = "Typr (typing practice)" },
      { "<leader>tS", "<cmd>TyprStats<cr>", desc = "Typr stats" },
    },
  },
}
