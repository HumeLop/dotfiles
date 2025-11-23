-- This file contains the configuration for the copilot.lua plugin.
-- NOTE: If you get git conflicts during updates, run:
--   rm -rf ~/.local/share/nvim/lazy/copilot.lua
-- Then reopen Neovim to reinstall

return {
  "zbirenbaum/copilot.lua",
  optional = true,
  event = "InsertEnter",   -- Load only when entering insert mode
  build = ":Copilot auth", -- Ensure authentication after install/update
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<M-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
  },
}
