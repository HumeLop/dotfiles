-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Spell checking (español + inglés) - Disabled by default, enabled per filetype in autocmds.lua
vim.opt.spell = false
vim.opt.spelllang = { "es", "en" }

-- Timeouts (más rápido para which-key)
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0

-- Word wrap and rulers
vim.opt.colorcolumn = "80,120"
vim.opt.wrap = true
vim.opt.linebreak = true

-- Clipboard (WSL support handled in lazy.lua bootstrap)
vim.opt.clipboard = "unnamedplus"

-- Persistencia del historial de deshacer
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Evitar archivos temporales de swap
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Mantener contexto al scrollear (ej. 8 líneas de margen)
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Performance improvements
vim.opt.updatetime = 250   -- Balanced speed for completion and diagnostics (200ms may be too aggressive)
vim.opt.redrawtime = 10000 -- Allow more time for syntax highlighting

-- Better search
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true  -- Unless search contains uppercase
