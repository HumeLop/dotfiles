return {
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = true,
    keys = {
      { "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",      noremap = true, desc = "goto preview definition" },
      { "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",     noremap = true, desc = "goto preview declaration" },
      { "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",  noremap = true, desc = "goto preview implementation" },
      { "gpy", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", noremap = true, desc = "goto preview type definition" },
      { "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>",      noremap = true, desc = "goto preview references" },
      { "gP",  "<cmd>lua require('goto-preview').close_all_win()<CR>",                noremap = true, desc = "close all preview windows" },
    },
  },
  {
    "nvim-mini/mini.hipatterns",
    event = "BufReadPre",
    opts = {
      highlighters = {
        hsl_color = {
          pattern = "hsl%(%d+,? %d+,? %d+%)",
          group = function(_, match)
            local utils = require("config.gentleman.utils")
            local hl = require("mini.hipatterns")
            local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
            h, s, l = tonumber(h), tonumber(s), tonumber(l)
            local hex_color = utils.hslToHex(h, s, l)
            return hl.compute_hex_color_group(hex_color, "bg")
          end,
        },
      },
    },
  },
  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        blame = "<Leader>gb",
        browse = "<Leader>go",
      },
    },
  },
}
