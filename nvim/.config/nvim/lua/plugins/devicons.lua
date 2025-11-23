return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  opts = {
    -- Override default icons
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh",
      },
      lua = {
        icon = "",
        color = "#51a0cf",
        cterm_color = "74",
        name = "Lua",
      },
      md = {
        icon = "",
        color = "#519aba",
        cterm_color = "67",
        name = "Markdown",
      },
      ["README.md"] = {
        icon = "",
        color = "#519aba",
        cterm_color = "67",
        name = "Readme",
      },
    },
    -- Globally enable default icons (if true, all files without a specific icon will use the default)
    default = true,
    -- Globally enable "strict" selection of icons (if false, will check for any match)
    strict = true,
    -- Override by filename
    override_by_filename = {
      [".gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "Gitignore",
      },
      ["Dockerfile"] = {
        icon = "",
        color = "#458ee6",
        name = "Dockerfile",
      },
      [".env"] = {
        icon = "",
        color = "#faf743",
        cterm_color = "227",
        name = "Env",
      },
    },
    -- Override by extension
    override_by_extension = {
      ["log"] = {
        icon = "",
        color = "#81e043",
        name = "Log",
      },
      ["astro"] = {
        icon = "",
        color = "#EF8547",
        name = "Astro",
      },
    },
  },
}
