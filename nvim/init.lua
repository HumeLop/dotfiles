-- Performance optimizations (load first)
require("config.performance").setup()

-- Configure Node.js before loading plugins
require("config.nodejs").setup({ silent = true })

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Sync with Omarchy desktop theme
require("config.omarchy-theme").setup({
  auto_sync = true, -- Automatically sync on startup
  silent = true,    -- Don't show notifications on startup
})
