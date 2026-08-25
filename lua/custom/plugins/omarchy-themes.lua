-- Preload Omarchy colorscheme plugins so theme switches can hot-reload
-- without a mid-session clone. Adapted from omarchy-nvim all-themes.lua.
return {
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    priority = 1000,
  },
  -- name/branch must match Omarchy 4's generated neovim.lua.tpl (aether)
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    lazy = true,
    priority = 1000,
  },
  {
    "bjarneo/ethereal.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "bjarneo/hackerman.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "bjarneo/vantablack.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "bjarneo/white.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
  },
  {
    "neanias/everforest-nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "kepano/flexoki-neovim",
    lazy = true,
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "tahayvr/matteblack.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "gthelding/monokai-pro.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 1000,
  },
  {
    "ficcdaf/ashen.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "OldJobobo/miasma.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "OldJobobo/retro-82.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "omacom-io/lumon.nvim",
    lazy = true,
    priority = 1000,
  },
}
