-- Omarchy Theme Integration
-- Automatically sync Neovim colorscheme with Omarchy desktop theme
-- Omarchy stores the current theme as a symlink at: ~/.config/omarchy/current/theme

local M = {}

-- Map Omarchy themes to Neovim colorschemes
local theme_map = {
  ["catppuccin"] = "catppuccin",
  ["catppuccin-latte"] = "catppuccin-latte",
  ["kanagawa"] = "kanagawa",
  ["rose-pine"] = "rose-pine",
  ["rose-pine-dark"] = "rose-pine-dark",
  ["tokyo-night"] = "tokyonight",
  ["nord"] = "nord",
  ["gruvbox"] = "gruvbox",
  ["everforest"] = "everforest",
  ["matte-black"] = "gentleman-kanagawa-blur", -- Fallback to your default
  ["osaka-jade"] = "gentleman-kanagawa-blur",  -- Fallback
  ["flexoki-light"] = "catppuccin-latte",      -- Fallback to light theme
  ["ristretto"] = "gentleman-kanagawa-blur",   -- Fallback
}

-- Get current Omarchy theme name
function M.get_omarchy_theme()
  local theme_path = vim.fn.expand("~/.config/omarchy/current/theme")

  -- Check if the symlink exists
  if vim.fn.isdirectory(theme_path) == 0 and vim.fn.filereadable(theme_path) == 0 then
    return nil
  end

  -- Read the symlink to get the actual theme directory
  local real_path = vim.fn.resolve(theme_path)

  -- Extract theme name from path (e.g., "/path/to/tokyo-night" -> "tokyo-night")
  local theme_name = vim.fn.fnamemodify(real_path, ":t")

  return theme_name
end

-- Apply Neovim colorscheme based on Omarchy theme
function M.sync_theme(opts)
  opts = opts or {}
  local silent = opts.silent or false

  local omarchy_theme = M.get_omarchy_theme()

  if not omarchy_theme then
    if not silent then
      vim.notify("⚠️  Could not detect Omarchy theme", vim.log.levels.WARN)
    end
    return false
  end

  local nvim_colorscheme = theme_map[omarchy_theme]

  if not nvim_colorscheme then
    if not silent then
      vim.notify("⚠️  No Neovim colorscheme mapped for Omarchy theme: " .. omarchy_theme, vim.log.levels.WARN)
    end
    return false
  end

  -- Try to set the colorscheme
  local ok, err = pcall(vim.cmd.colorscheme, nvim_colorscheme)

  if ok then
    if not silent then
      vim.notify("🎨 Theme synced: " .. omarchy_theme .. " → " .. nvim_colorscheme, vim.log.levels.INFO)
    end
    return true
  else
    if not silent then
      vim.notify("❌ Failed to set colorscheme: " .. nvim_colorscheme .. "\n" .. tostring(err), vim.log.levels.ERROR)
    end
    return false
  end
end

-- Setup function to be called on startup
function M.setup(opts)
  opts = opts or {}
  local auto_sync = opts.auto_sync ~= false -- Default: true
  local silent = opts.silent or false

  if auto_sync then
    -- Sync on startup
    vim.schedule(function()
      M.sync_theme({ silent = silent })
    end)
  end

  -- Create user command for manual sync
  vim.api.nvim_create_user_command("OmarchyThemeSync", function()
    M.sync_theme({ silent = false })
  end, { desc = "Sync Neovim colorscheme with Omarchy theme" })

  -- Create command to show current mapping
  vim.api.nvim_create_user_command("OmarchyThemeInfo", function()
    local omarchy_theme = M.get_omarchy_theme()
    if omarchy_theme then
      local nvim_colorscheme = theme_map[omarchy_theme]
      local current_colorscheme = vim.g.colors_name or "none"

      local info = {
        "🎨 Omarchy Theme Integration",
        "",
        "Omarchy theme: " .. omarchy_theme,
        "Mapped to: " .. (nvim_colorscheme or "not mapped"),
        "Current Neovim: " .. current_colorscheme,
        "",
        "Commands:",
        "  :OmarchyThemeSync - Sync with Omarchy",
        "  :OmarchyThemeToggle - Toggle auto-sync",
      }
      vim.notify(table.concat(info, "\n"), vim.log.levels.INFO)
    else
      vim.notify("❌ Could not detect Omarchy theme", vim.log.levels.ERROR)
    end
  end, { desc = "Show Omarchy theme information" })
end

return M
