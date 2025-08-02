return {
  "wuelnerdotexe/vim-astro",
  ft = "astro", -- Lazy load on filetype
  config = function()
    -- Optional: Configure vim-astro settings
    vim.g.astro_typescript = "enable" -- Enable TypeScript support for Astro
    vim.g.astro_stylus = "disable"  -- Disable Stylus support if not needed
  end,
}
