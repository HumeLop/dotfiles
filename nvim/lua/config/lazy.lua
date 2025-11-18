-- This file contains the configuration for setting up the lazy.nvim plugin manager in Neovim.

-- Define the path to the lazy.nvim plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if the lazy.nvim plugin is not already installed
if not vim.loop.fs_stat(lazypath) then
  -- Bootstrap lazy.nvim by cloning the repository
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end

-- Prepend the lazy.nvim path to the runtime path
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- WSL clipboard configuration
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank",                  -- Use win32yank for clipboard operations
    copy = {
      ["+"] = "win32yank.exe -i --crlf", -- Command to copy to the system clipboard
      ["*"] = "win32yank.exe -i --crlf", -- Command to copy to the primary clipboard
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf", -- Command to paste from the system clipboard
      ["*"] = "win32yank.exe -o --lf", -- Command to paste from the primary clipboard
    },
    cache_enabled = false,             -- Disable clipboard caching
  }
end

-- Setup lazy.nvim with the specified configuration
require("lazy").setup({
  spec = {
    -- Add LazyVim and import its plugins
    { "LazyVim/LazyVim",                                     import = "lazyvim.plugins" },
    -- Import any extra modules here
    -- Editor plugins
    { import = "lazyvim.plugins.extras.editor.harpoon2" },
    { import = "lazyvim.plugins.extras.editor.mini-files" },
    -- { import = "lazyvim.plugins.extras.editor.snacks_explorer" },
    { import = "lazyvim.plugins.extras.editor.snacks_picker" },

    -- Formatting plugins
    { import = "lazyvim.plugins.extras.formatting.biome" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    -- Linting plugins
    { import = "lazyvim.plugins.extras.linting.eslint" },

    -- Language support plugins
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.angular" },
    { import = "lazyvim.plugins.extras.lang.astro" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.nix" },
    { import = "lazyvim.plugins.extras.lang.toml" },

    -- Coding plugins
    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    { import = "lazyvim.plugins.extras.editor.mini-diff" },
    { import = "lazyvim.plugins.extras.coding.blink" },

    -- Utility plugins
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },

    -- AI plugins
    { import = "lazyvim.plugins.extras.ai.copilot" },
    { import = "lazyvim.plugins.extras.ai.copilot-chat" },

    -- Import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- Custom plugins inherit lazy=false to load at startup (colorschemes, UI, etc.)
    -- Individual plugins can override this with their own lazy=true setting
    -- LazyVim core plugins are always lazy-loaded appropriately
    lazy = false,
    -- Use latest git commits (more stable than old releases for most plugins)
    -- Specific plugins can pin versions if needed (e.g., version = "1.2.3")
    version = false,                                       -- Always use the latest git commit
  },
  install = { colorscheme = { "tokyonight", "habamax" } }, -- Specify colorschemes to install
  checker = {
    enabled = true,                                        -- Automatically check for plugin updates
    frequency = 86400,                                     -- Check every 24 hours (less interruptions, still stays updated)
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      -- Disable some runtime path plugins to improve performance
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
