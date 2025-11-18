-- This file contains the configuration for the opencode.nvim plugin.
-- NOTE: Currently disabled - alternative AI coding assistant
-- Kept for future testing and comparison

return {
  "sudo-tee/opencode.nvim",
  enabled = false, -- Disabled: Testing other AI assistants, config preserved for reference
  config = function()
    -- full config from history
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "MeanderingProgrammer/render-markdown.nvim", opts = {}, ft = { "markdown", "Avante", "copilot-chat", "opencode_output" } },
  },
}
