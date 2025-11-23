-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
  pattern = "*",
  callback = function(args)
    -- Check if autoformat is disabled globally
    if vim.g.disable_autoformat then
      return
    end

    local excluded_filetypes = { "lazy", "oil", "TelescopePrompt" }
    if vim.tbl_contains(excluded_filetypes, vim.bo[args.buf].filetype) then
      return
    end

    -- Exclude specific files from formatting
    if vim.fn.fnamemodify(args.file, ":t") == "bun.lock" then
      return
    end

    -- Try conform.nvim first (if available)
    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
      local formatters = conform.list_formatters(args.buf)
      -- Only use conform if there are formatters available
      if #formatters > 0 then
        local format_ok, err = pcall(function()
          conform.format({
            bufnr = args.buf,
            lsp_fallback = true,
            timeout_ms = 3000,
          })
        end)
        if not format_ok and not vim.g.disable_autoformat then
          vim.notify("Format error: " .. tostring(err), vim.log.levels.WARN)
        end
        return
      end
    end

    -- Fallback to LSP formatting
    -- Check if there's an LSP client attached that supports formatting
    local clients = vim.lsp.get_clients({ bufnr = args.buf })
    local has_formatter = false

    for _, client in ipairs(clients) do
      if client.supports_method("textDocument/formatting") then
        has_formatter = true
        break
      end
    end

    -- Only format if there's a formatter available
    if has_formatter then
      vim.lsp.buf.format({ async = false, bufnr = args.buf, timeout_ms = 3000 })
    end
  end,
  desc = "Format file on save (conform or LSP)",
}) -- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("ResizeSplits", { clear = true }),
  callback = function()
    vim.cmd("wincmd =")
  end,
  desc = "Automatically resize splits on window resize",
})

-- Restore cursor position when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("LoadLastPosition", { clear = true }),
  callback = function(opts)
    local mark = vim.api.nvim_buf_get_mark(opts.buf, '"')
    local line = mark[1]
    local col = mark[2]
    if line > 0 and line <= vim.api.nvim_buf_line_count(opts.buf) then
      vim.api.nvim_win_set_cursor(0, { line, col })
      -- Ensure the view is centered on the cursor position
      -- This command is optional but can improve UX for files where the cursor was far down
      vim.cmd("normal! zz")
    end
  end,
  desc = "Restore cursor position for the last opened buffer",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ hidewidth = false, timeout = 200 })
  end,
  desc = "Highlight text on yank",
})

-- Enable spell checking only for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SpellCheckFileTypes", { clear = true }),
  pattern = { "markdown", "text", "gitcommit", "plaintex", "org", "norg" },
  callback = function()
    vim.opt_local.spell = true
  end,
  desc = "Enable spell checking for text-based filetypes",
})

-- Auto-compile spell files when custom spell files are edited
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("SpellCompile", { clear = true }),
  pattern = { "*/spell/*.txt" },
  callback = function(args)
    local spell_file = args.file
    if spell_file:match("_words%.txt$") or spell_file:match("_custom%.txt$") then
      vim.cmd("silent mkspell! " .. spell_file:gsub("%.txt$", ".spl"))
      vim.notify("✓ Spell file compiled: " .. vim.fn.fnamemodify(spell_file, ":t"), vim.log.levels.INFO)
    end
  end,
  desc = "Auto-compile spell files on save",
})

-- User commands for Oil
vim.api.nvim_create_user_command("OilToggleHidden", function()
  require("oil").toggle_hidden()
end, { desc = "Toggle hidden files in Oil" })

vim.api.nvim_create_user_command("OilFloat", function()
  require("oil").toggle_float()
end, { desc = "Open Oil in floating window" })

vim.api.nvim_create_user_command("OilCurrentDir", function()
  require("oil").open(vim.fn.getcwd())
end, { desc = "Open Oil in current working directory" })

-- Format commands
vim.api.nvim_create_user_command("FormatInfo", function()
  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[buf].filetype

  -- Check for conform.nvim
  local conform_ok, conform = pcall(require, "conform")
  local conform_formatters = {}
  if conform_ok then
    conform_formatters = conform.list_formatters(buf)
  end

  -- Check for LSP formatters
  local clients = vim.lsp.get_clients({ bufnr = buf })
  local lsp_formatters = {}
  for _, client in ipairs(clients) do
    if client.supports_method("textDocument/formatting") then
      table.insert(lsp_formatters, client.name)
    end
  end

  -- Show info
  local info = {
    "📝 Format Info",
    "",
    "Filetype: " .. filetype,
    "",
    "Conform formatters: " .. (vim.tbl_count(conform_formatters) > 0 and table.concat(
      vim.tbl_map(function(f)
        return f.name
      end, conform_formatters),
      ", "
    ) or "None"),
    "",
    "LSP formatters: " .. (vim.tbl_count(lsp_formatters) > 0 and table.concat(lsp_formatters, ", ") or "None"),
  }

  vim.notify(table.concat(info, "\n"), vim.log.levels.INFO)
end, { desc = "Show available formatters for current buffer" })

vim.api.nvim_create_user_command("FormatToggle", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  if vim.g.disable_autoformat then
    vim.notify("🚫 Autoformat desactivado", vim.log.levels.WARN)
  else
    vim.notify("✅ Autoformat activado", vim.log.levels.INFO)
  end
end, { desc = "Toggle autoformat on save" })

vim.api.nvim_create_user_command("Format", function()
  local buf = vim.api.nvim_get_current_buf()

  -- Try conform first
  local conform_ok, conform = pcall(require, "conform")
  if conform_ok then
    local formatters = conform.list_formatters(buf)
    if #formatters > 0 then
      vim.notify("Formateando con: " .. table.concat(
        vim.tbl_map(function(f)
          return f.name
        end, formatters),
        ", "
      ))
      conform.format({ bufnr = buf, timeout_ms = 3000 })
      return
    end
  end

  -- Fallback to LSP
  local clients = vim.lsp.get_clients({ bufnr = buf })
  for _, client in ipairs(clients) do
    if client.supports_method("textDocument/formatting") then
      vim.notify("Formateando con LSP: " .. client.name)
      vim.lsp.buf.format({ bufnr = buf, timeout_ms = 3000 })
      return
    end
  end

  vim.notify("No hay formateadores disponibles", vim.log.levels.WARN)
end, { desc = "Format current buffer manually" })

-- Performance benchmark command
vim.api.nvim_create_user_command("StartupTime", function()
  vim.cmd("!nvim --startuptime /tmp/nvim-startup.log +qa 2>&1 && cat /tmp/nvim-startup.log | tail -1")
end, { desc = "Measure Neovim startup time" })

-- Profile Neovim
vim.api.nvim_create_user_command("ProfileStart", function()
  require("lazy.core.util").track()
  vim.notify("Profiling started! Use :ProfileStop to see results", vim.log.levels.INFO)
end, { desc = "Start profiling Neovim" })

vim.api.nvim_create_user_command("ProfileStop", function()
  local profile = require("lazy.core.util").track_end()
  vim.notify("Check :Lazy profile for results", vim.log.levels.INFO)
  vim.cmd("Lazy profile")
end, { desc = "Stop profiling and show results" })

-- Watch for Omarchy theme changes (optional - may cause overhead)
-- Uncomment to enable automatic theme sync when Omarchy theme changes
-- vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
--   group = vim.api.nvim_create_augroup("OmarchyThemeWatch", { clear = true }),
--   callback = function()
--     require("config.omarchy-theme").sync_theme({ silent = true })
--   end,
--   desc = "Auto-sync with Omarchy theme on focus",
-- })

-- Clean and reinstall a plugin with git conflicts
vim.api.nvim_create_user_command("PluginClean", function(opts)
  local plugin_name = opts.args
  if plugin_name == "" then
    vim.notify("❌ Uso: :PluginClean <nombre-del-plugin>", vim.log.levels.ERROR)
    vim.notify("   Ejemplo: :PluginClean copilot.lua", vim.log.levels.INFO)
    return
  end

  local plugin_path = vim.fn.stdpath("data") .. "/lazy/" .. plugin_name

  if vim.fn.isdirectory(plugin_path) == 0 then
    vim.notify("❌ Plugin no encontrado: " .. plugin_name, vim.log.levels.ERROR)
    return
  end

  local choice = vim.fn.confirm("¿Eliminar y reinstalar el plugin '" .. plugin_name .. "'?", "&Sí\n&No", 2)

  if choice == 1 then
    vim.fn.delete(plugin_path, "rf")
    vim.notify("🗑️  Plugin eliminado: " .. plugin_name, vim.log.levels.INFO)
    vim.notify("💡 Ejecuta :Lazy sync para reinstalar", vim.log.levels.INFO)
  end
end, {
  nargs = 1,
  complete = function()
    local lazy_path = vim.fn.stdpath("data") .. "/lazy"
    local plugins = vim.fn.readdir(lazy_path)
    return plugins
  end,
  desc = "Clean and reinstall a plugin with conflicts",
})
