-- This file contains the configuration for the avante.nvim plugin.
-- NOTE: Currently disabled in favor of Copilot Chat
-- Kept for future reference and easy re-enabling

return {
  {
    "yetone/avante.nvim",
    enabled = false, -- Disabled: Using copilot-chat instead, but config preserved for reference
    build = function()
      if vim.fn.has("win32") == 1 then
        return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      else
        return "make"
      end
    end,
    event = "VeryLazy",
    version = false,
    opts = function(_, opts)
      -- opts for avante
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      { "HakonHarnes/img-clip.nvim", event = "VeryLazy", opts = {} },
    },
  },
}
