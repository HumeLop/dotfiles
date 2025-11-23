-- Colorschemes synchronized with Omarchy desktop theme
-- Omarchy theme sync configured in config/omarchy-theme.lua

return {
  -- Catppuccin (supports both mocha and latte variants)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = true,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Default variant
        transparent_background = true,
        term_colors = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = { enabled = true },
        },
      })

      -- Also setup latte variant
      require("catppuccin").setup({
        flavour = "mocha", -- Default variant
        transparent_background = false, -- Light themes usually need background
        term_colors = true,
      })
    end,
  },
  {
    "Gentleman-Programming/gentleman-kanagawa-blur",
    name = "gentleman-kanagawa-blur",
    priority = 1000,
    lazy = false, -- Keep loaded as it's the default colorscheme
  },
  {
    "Alan-TheGentleman/oldworld.nvim",
    lazy = true, -- Lazy load alternative colorschemes
    priority = 1000,
    opts = {},
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = true, -- Lazy load alternative colorschemes
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = { ui = { bg_gutter = "none" } } },
        },
        overrides = function(colors)
          return {
            LineNr = { bg = "none" },
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            TelescopeNormal = { bg = "none" },
            TelescopeBorder = { bg = "none" },
            LspInfoBorder = { bg = "none" },
          }
        end,
        theme = "wave",
        background = { dark = "wave", light = "lotus" },
      })
    end,
  },
  -- Tokyo Night (Omarchy: tokyo-night)
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      terminal_colors = true,
    },
  },
  -- Rose Pine (Omarchy: rose-pine)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 1000,
    opts = {
      variant = "main",
      disable_background = true,
      disable_float_background = true,
    },
  },
  -- Rose Pine (Omarchy: rose-pine-dark)
  {
    "rose-pine/neovim",
    name = "rose-pine-dark",
    variant = "moon",
    lazy = true,
    priority = 1000,
    opts = {
      variant = "main",
      disable_background = true,
      disable_float_background = true,
    },
  },
  -- Nord (Omarchy: nord)
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.nord_disable_background = true
      vim.g.nord_borders = false
    end,
  },
  -- Gruvbox (Omarchy: gruvbox)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent_mode = true,
    },
  },
  -- Everforest (Omarchy: everforest)
  {
    "neanias/everforest-nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 1,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- Default colorscheme (will be overridden by Omarchy sync)
      colorscheme = "gentleman-kanagawa-blur",
    },
  },
}
