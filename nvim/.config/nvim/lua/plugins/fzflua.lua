return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",                     -- Load when FzfLua command is used
  keys = {
    { "<leader>f", desc = "FzfLua" }, -- Auto-load on leader+f prefix
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
}
