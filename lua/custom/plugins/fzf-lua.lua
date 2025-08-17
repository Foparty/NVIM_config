return {
  "ibhagwan/fzf-lua",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    keymap = {
      builtin = {
        ["<c-d>"] = "preview-page-down", -- Keep default
        ["<c-u>"] = "preview-page-up", -- Keep default
      },
      fzf = {
        ["tab"] = "toggle",
        ["alt-a"] = "toggle-all",
      },
    },
    winopts = {
      width = 0.95, -- Override default
      height = 0.95, -- Override default
    },
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("fzf-lua").files({ cwd_only = true })
      end,
      desc = "files in cwd",
    },
    {
      "<leader>.",
      function()
        require("fzf-lua").lsp_document_symbols()
      end,
      desc = "document symbols",
    },
    {
      "<leader>,",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "open buffers",
    },
    {
      "<leader>/",
      function()
        require("fzf-lua").live_grep({ cwd_only = true })
      end,
      desc = "grep cwd",
    },
    {
      "<leader>w",
      function()
        require("fzf-lua").grep_cword({ cwd_only = true, prompt = "current WORD" })
      end,
      desc = "grep cwd",
    },
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "files in cwd",
    },
    {
      "<leader>fc",
      function()
        require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "files in cwd",
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").helptags()
      end,
      desc = "help",
    },
    {
      "<leader>fk",
      function()
        require("fzf-lua").keymaps()
      end,
      desc = "keymaps",
    },
    {
      "<leader>gf",
      function()
        require("fzf-lua").git_bcommits()
      end,
      desc = "buffer commits",
    },
    {
      "<leader>gb",
      function()
        require("fzf-lua").git_branches()
      end,
      desc = "branches",
    },
    {
      "gs",
      function()
        require("fzf-lua").lsp_workspace_symbols()
      end,
      desc = "project symbols",
    },
    {
      "<leader>dl",
      function()
        require("fzf-lua").diagnostics_workspace()
      end,
      desc = "diagnostics",
    },
    {
      "gd",
      function()
        require("fzf-lua").lsp_definitions()
      end,
      desc = "go to definition",
    },
    {
      "gD",
      function()
        require("fzf-lua").lsp_declarations()
      end,
      desc = "references",
    },
    {
      "gy",
      function()
        require("fzf-lua").lsp_typedefs()
      end,
      desc = "type definitions",
    },
    {
      "gi",
      function()
        require("fzf-lua").lsp_implementations()
      end,
      desc = "implementations",
    },
    {
      "g.",
      function()
        require("fzf-lua").lsp_code_actions()
      end,
      desc = "code actions",
    },
    {
      "gm",
      function()
        require("fzf-lua").marks()
      end,
      desc = "marks",
    },
    {
      "<leader>sc",
      function()
        require("fzf-lua").changes()
      end,
      desc = "changes",
    },

    {
      "<leader>fr",
      function()
        require("fzf-lua").registers()
      end,
      desc = "registers",
    },
    {
      "<leader>ss",
      function()
        require("fzf-lua").spellcheck()
      end,
      desc = "spellcheck",
    },
    {
      "z=",
      function()
        require("fzf-lua").spell_suggest()
      end,
      desc = "spellcheck",
    },
  },
  -- config = function()
  --   require("fzf-lua").setup({
  --     winopts = {
  --       width = 0.95,
  --       height = 0.95,
  --     },
  --     files = {
  --       prompt = "Files❯ ",
  --       cwd_prompt = true,
  --     },
  --     grep = {
  --       prompt = "Grep❯ ",
  --     },
  --     buffers = {
  --       prompt = "Buffers❯ ",
  --     },
  --     keymaps = {
  --       prompt = "Keymaps❯ ",
  --     },
  --     help = {
  --       prompt = "Help❯ ",
  --     },
  --   })
  --
  --
  --   -- Keymaps
  --   vim.keymap.set("n", "<leader><leader>", function()
  --     fzf.files({ cwd = vim.loop.cwd() })
  --   end, { desc = "Find Files" })
  --   vim.keymap.set("n", "<leader>,", fzf.buffers, { desc = "Buffers" })
  --   vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps" })
  --   vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Grep" })
  --   vim.keymap.set("n", "<leader>fr", fzf.registers, { desc = "Registers" })
  --   vim.keymap.set("n", "<leader>fc", function()
  --     fzf.files({ cwd = vim.fn.stdpath("config") })
  --   end, { desc = "Find Config File" })
  --   vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help" })
  --   vim.keymap.set("n", "<leader>fn", function()
  --     fzf.files({ cwd = "~/notes/" })
  --   end, { desc = "Find Notes" })
  --   vim.keymap.set("n", "<leader>fm", function()
  --     fzf.live_grep({ cwd = "~/notes/" })
  --   end, { desc = "Grep Notes" })
  --   vim.keymap.set({ "n", "x" }, "<leader>fw", fzf.grep_cword, { desc = "Grep word/selection" })
  --
  --   -- LSP
  --   vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "Goto Definition" })
  --   vim.keymap.set("n", "gD", fzf.lsp_declarations, { desc = "Goto Declaration" })
  --   vim.keymap.set("n", "grr", fzf.lsp_references, { desc = "References" })
  --   vim.keymap.set("n", "gI", fzf.lsp_implementations, { desc = "Goto Implementation" })
  --   vim.keymap.set("n", "gy", fzf.lsp_typedefs, { desc = "Goto Type Definition" })
  --   vim.keymap.set("n", "gs", fzf.lsp_document_symbols, { desc = "LSP Symbols" })
  --   vim.keymap.set("n", "<leader>sS", fzf.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })
  -- end,
}
