return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      help = true,
    },
    -- config = function()
    --   require("copilot").setup({})
    -- end,
    -- opts = {
    --
    --   panel = {
    --     enabled = true,
    --     auto_refresh = false,
    --     keymap = {
    --       jump_prev = "[[",
    --       jump_next = "]]",
    --       accept = "<CR>",
    --       refresh = "gr",
    --       open = "<M-CR>",
    --     },
    --     layout = {
    --       position = "bottom", -- | top | left | right | bottom |
    --       ratio = 0.4,
    --     },
    --   },
    --   suggestion = {
    --     enabled = true,
    --     auto_trigger = false,
    --     hide_during_completion = true,
    --     debounce = 75,
    --     trigger_on_accept = true,
    --     keymap = {
    --       accept = "<M-l>",
    --       accept_word = false,
    --       accept_line = false,
    --       next = "<M-]>",
    --       prev = "<M-[>",
    --       dismiss = "<C-]>",
    --     },
    --   },
    --   filetypes = {
    --     yaml = false,
    --     markdown = false,
    --     help = false,
    --     gitcommit = false,
    --     gitrebase = false,
    --     hgcommit = false,
    --     svn = false,
    --     cvs = false,
    --     ["."] = false,
    --   },
    --   auth_provider_url = nil, -- URL to authentication provider, if not "https://github.com/"
    --   logger = {
    --     file = vim.fn.stdpath("log") .. "/copilot-lua.log",
    --     file_log_level = vim.log.levels.OFF,
    --     print_log_level = vim.log.levels.WARN,
    --     trace_lsp = "off", -- "off" | "messages" | "verbose"
    --     trace_lsp_progress = false,
    --     log_lsp_messages = false,
    --   },
    --   copilot_node_command = "node", -- Node.js version must be > 20
    --   workspace_folders = {},
    --   copilot_model = "",
    --   root_dir = function()
    --     return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
    --   end,
    --   should_attach = function(_, _)
    --     if not vim.bo.buflisted then
    --       logger.debug("not attaching, buffer is not 'buflisted'")
    --       return false
    --     end
    --
    --     if vim.bo.buftype ~= "" then
    --       logger.debug("not attaching, buffer 'buftype' is " .. vim.bo.buftype)
    --       return false
    --     end
    --
    --     return true
    --   end,
    --   server = {
    --     type = "nodejs", -- "nodejs" | "binary"
    --     custom_server_filepath = nil,
    --   },
    --   server_opts_overrides = {},
    -- },
  },
  keys = {
    { "<leader>ce", "<cmd>Copilot enable<cr>",  desc = "Enable Copilot" },
    { "<leader>cd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
  },
}
