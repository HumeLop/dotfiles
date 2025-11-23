local M = {}

function M.load()
  vim.opt.termguicolors = true
  vim.g.colors_name = "arc-blueberry"

  local colors = {
    bg = "#111422",
    fg = "#bcc1dc",
    blue = "#69C3FF",
    green = "#3CEC85",
    yellow = "#EACD61",
    red = "#E35535",
    purple = "#F38CEC",
    cyan = "#22ECDB",
    subtle = "#1a1e33",
    orange = "#FF955C",
    magenta = "#D67AD2",
    comment = "#4F587A", -- A brighter, more readable grey for comments
  }

  local highlights = {
    -- Sintaxis
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg },
    Comment = { fg = colors.comment, italic = true },
    Constant = { fg = colors.red },
    String = { fg = colors.green },
    Character = { fg = colors.green },
    Number = { fg = colors.orange },
    Boolean = { fg = colors.red },
    Float = { fg = colors.orange },
    Identifier = { fg = colors.purple },
    Function = { fg = colors.blue },
    Statement = { fg = colors.yellow },
    Conditional = { fg = colors.yellow },
    Repeat = { fg = colors.yellow },
    Label = { fg = colors.yellow },
    Operator = { fg = colors.cyan },
    Keyword = { fg = colors.yellow },
    Exception = { fg = colors.red },
    Type = { fg = colors.cyan },
    Structure = { fg = colors.cyan },
    StorageClass = { fg = colors.cyan },
    PreProc = { fg = colors.magenta },
    Include = { fg = colors.magenta },
    Define = { fg = colors.magenta },
    Macro = { fg = colors.magenta },
    PreCondit = { fg = colors.magenta },
    Special = { fg = colors.purple },
    SpecialChar = { fg = colors.purple },
    Tag = { fg = colors.purple },
    Delimiter = { fg = colors.fg },
    SpecialComment = { fg = colors.comment, italic = true },
    Debug = { fg = colors.red },

    -- UI
    Visual = { bg = colors.subtle },
    CursorLine = { bg = colors.subtle },
    CursorColumn = { bg = colors.subtle },
    ColorColumn = { bg = colors.subtle },
    LineNr = { fg = colors.subtle },
    CursorLineNr = { fg = colors.yellow },
    StatusLine = { fg = colors.fg, bg = colors.subtle },
    StatusLineNC = { fg = colors.subtle, bg = colors.bg },
    Pmenu = { fg = colors.fg, bg = colors.subtle },
    PmenuSel = { fg = colors.bg, bg = colors.blue },
    Search = { fg = colors.bg, bg = colors.yellow },
    IncSearch = { fg = colors.bg, bg = colors.green },

    -- Integrations & UI Extras
    MatchParen = { bg = colors.subtle, bold = true },
    FloatBorder = { fg = colors.subtle },
    WinSeparator = { fg = colors.subtle },

    -- LSP Diagnostics
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.cyan },
    DiagnosticHint = { fg = colors.purple },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.purple },

    -- Git
    DiffAdd = { bg = "#132515" },
    DiffChange = { bg = "#122330" },
    DiffDelete = { bg = "#2f1b19" },
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.blue },
    GitSignsDelete = { fg = colors.red },

    -- Telescope
    TelescopeBorder = { fg = colors.subtle },
    TelescopeSelection = { bg = colors.subtle, bold = true },
  }

  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
