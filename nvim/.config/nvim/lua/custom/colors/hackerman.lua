-- lua/custom/colors/hackerman.lua
local M = {}

function M.load()
  vim.opt.termguicolors = true
  vim.g.colors_name = "hackerman"

  local colors = {
    base00 = "#0B0C16", -- bg
    base01 = "#2a2d48", -- dark-grey (for UI elements, derived from base03)
    base02 = "#0B0C16", -- selection bg (same as bg)
    base03 = "#6a6e95", -- comments, mid-grey
    base04 = "#85E1FB", -- light-blue
    base05 = "#ddf7ff", -- fg
    base06 = "#ddf7ff", -- light fg
    base07 = "#85E1FB", -- light bg
    base08 = "#50f872", -- green (variables, errors)
    base09 = "#85ff9d", -- light-green (constants)
    base0A = "#50f7d4", -- turquoise (types)
    base0B = "#4fe88f", -- green (strings)
    base0C = "#7cf8f7", -- cyan (regex, operators)
    base0D = "#829dd4", -- blue (functions)
    base0E = "#86a7df", -- light-blue (keywords)
    base0F = "#a4ffec", -- turquoise (deprecated)
  }

  local highlights = {
    -- Syntax
    Normal = { fg = colors.base05, bg = colors.base00 },
    Comment = { fg = colors.base03, italic = true },
    Constant = { fg = colors.base09 },
    String = { fg = colors.base0B },
    Number = { fg = colors.base09 },
    Identifier = { fg = colors.base08 },
    Function = { fg = colors.base0D },
    Statement = { fg = colors.base0E },
    Keyword = { fg = colors.base0E },
    Type = { fg = colors.base0A },
    Operator = { fg = colors.base0C },
    PreProc = { fg = colors.base0A },
    Special = { fg = colors.base0C },
    Error = { fg = colors.base08, bold = true },
    Todo = { fg = colors.base00, bg = colors.base0A, bold = true },

    -- UI
    NormalFloat = { bg = colors.base01 },
    FloatBorder = { fg = colors.base03 },
    Visual = { bg = colors.base01 },
    CursorLine = { bg = "#1D1F2D" }, -- A slightly lighter bg
    CursorLineNr = { fg = colors.base04 },
    LineNr = { fg = colors.base03 },
    StatusLine = { fg = colors.base05, bg = colors.base01 },
    StatusLineNC = { fg = colors.base03, bg = colors.base00 },
    WinSeparator = { fg = colors.base03 },

    -- LSP & Git
    LspDiagnosticsDefaultError = { fg = colors.base08 },
    LspDiagnosticsDefaultWarning = { fg = colors.base0A },
    LspDiagnosticsDefaultInfo = { fg = colors.base0C },
    LspDiagnosticsDefaultHint = { fg = colors.base0E },
    GitSignsAdd = { fg = colors.base0B },
    GitSignsChange = { fg = colors.base0D },
    GitSignsDelete = { fg = colors.base08 },
  }

  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
