-- Performance optimizations for Neovim
-- This module is loaded FIRST in init.lua to ensure maximum performance gains
-- Includes: disabled built-in plugins, ShaDa optimization, and large file handling

local M = {}

function M.setup()
  -- ===== DISABLE UNNECESSARY BUILT-IN PLUGINS =====
  -- These are rarely used and disabling them speeds up startup time
  local disabled_built_ins = {
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
  }

  for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
  end

  -- ===== PERFORMANCE TWEAKS =====
  -- Keep lazyredraw disabled as it conflicts with modern UI plugins
  vim.opt.lazyredraw = false

  -- ===== SHADA OPTIMIZATION =====
  -- Defer ShaDa loading until after startup (saves ~10-20ms)
  vim.opt.shadafile = "NONE" -- Disable during startup
  vim.schedule(function()
    vim.opt.shadafile = ""   -- Re-enable after UI is ready
  end)

  -- ===== LARGE FILE HANDLING =====
  -- Automatically disable heavy features for files > 100KB
  vim.api.nvim_create_autocmd("BufReadPre", {
    callback = function(args)
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
      if ok and stats and stats.size > 100000 then -- 100KB threshold
        vim.notify("⚡ Large file detected, optimizing for performance", vim.log.levels.WARN)

        -- Disable resource-intensive features
        vim.opt_local.spell = false       -- No spell checking
        vim.opt_local.swapfile = false    -- No swap file
        vim.opt_local.undofile = false    -- No undo history
        vim.opt_local.breakindent = false -- Simpler line breaking
        vim.opt_local.colorcolumn = ""    -- No column markers
        vim.opt_local.statuscolumn = ""   -- Minimal status column
        vim.opt_local.signcolumn = "no"   -- No sign column
        vim.opt_local.foldcolumn = "0"    -- No fold column
        vim.opt_local.winbar = ""         -- No winbar

        -- Disable treesitter (major performance gain for large files)
        vim.cmd("TSBufDisable highlight")
        vim.cmd("TSBufDisable indent")
      end
    end,
  })
end

return M
