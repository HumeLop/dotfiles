-- This file contains the configuration for the CopilotChat.nvim plugin.

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    opts = { -- full opts from history
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = false
        end,
      })
      chat.setup(opts)
    end,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        providers = {
          path = {
            enabled = function()
              return vim.bo.filetype ~= "copilot-chat"
            end,
          },
        },
      },
    },
  },
}
