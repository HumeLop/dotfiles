return {
  "saghen/blink.cmp",
  lazy = true,
  dependencies = { "saghen/blink.compat" },
  opts = {
    sources = {
      -- Include standard sources + avante sources
      default = { "lsp", "path", "snippets", "buffer", "avante_commands", "avante_mentions", "avante_files" },
      compat = {
        "avante_commands",
        "avante_mentions",
        "avante_files",
      },
      providers = {
        avante_commands = {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 90,
          opts = {},
        },
        avante_files = {
          name = "avante_files",
          module = "blink.compat.source",
          score_offset = 100,
          opts = {},
        },
        avante_mentions = {
          name = "avante_mentions",
          module = "blink.compat.source",
          score_offset = 1000,
          opts = {},
        },
      },
    },
    -- Appearance configuration
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    -- Completion behavior
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = true,
      },
    },
    -- Signature help
    signature = {
      enabled = true,
    },
  },
}
