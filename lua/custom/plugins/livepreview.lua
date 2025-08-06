return {
  "brianhuster/live-preview.nvim",
  dependencies = {
    -- You can choose one of the following pickers
    "folke/snacks.nvim",
  },
  config = function()
    require("livepreview.config").set({}) -- Add your configuration here if needed
    -- Set keymap
    vim.keymap.set("n", "<leader>lp", "<cmd>LivePreview start<CR>", { desc = "Start Live Preview" })
  end,
}
