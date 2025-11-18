-- This file contains the configuration for the gemini-cli.nvim plugin.

return {
  "jonroosevelt/gemini-cli.nvim",
  enabled = false,
  config = function()
    require("gemini").setup()
  end,
}
