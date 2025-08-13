return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make", -- Run this on install/update
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "zbirenbaum/copilot.lua", -- For Copilot
  },
  opts = {
    provider = "copilot",                -- Set Copilot as the default provider
    auto_suggestions_provider = "copilot", -- Optional: Use for auto-completions (but increase debounce if needed)
    behaviour = {
      auto_suggestions = false,          -- Enable if desired
      auto_set_highlight_group = true,
    },
    mappings = {
      -- Customize keymaps if needed, e.g., <Leader>aa to open Avante
    },
    -- Increase debounce for Copilot to avoid high-frequency requests (recommended)
    suggestions = {
      debounce = 150, -- Milliseconds; adjust higher if performance issues occur
    },
    providers = {

      copilot = {
        model = "gpt-4.1", -- Explicitly set GPT-4.1 (check Avante docs for exact syntax)
      },
    },
  },
  config = function(_, opts)
    require("avante").setup(opts)
    -- Force model selection on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("AvanteModels gpt-4.1") -- Auto-select GPT-4.1 on Neovim start
      end,
    })
  end,
}
