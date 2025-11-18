local mode = {
  "mode",
  fmt = function(s)
    local mode_map = {
      ["NORMAL"] = "N",
      ["O-PENDING"] = "N?",
      ["INSERT"] = "I",
      ["VISUAL"] = "V",
      ["V-BLOCK"] = "VB",
      ["V-LINE"] = "VL",
      ["V-REPLACE"] = "VR",
      ["REPLACE"] = "R",
      ["COMMAND"] = "!",
      ["SHELL"] = "SH",
      ["TERMINAL"] = "T",
      ["EX"] = "X",
      ["S-BLOCK"] = "SB",
      ["S-LINE"] = "SL",
      ["SELECT"] = "S",
      ["CONFIRM"] = "Y?",
      ["MORE"] = "M",
    }
    return mode_map[s] or s
  end,
}

local function codecompanion_adapter_name()
  local chat = require("codecompanion").buf_get_chat(vim.api.nvim_get_current_buf())
  if not chat then
    return nil
  end

  return " " .. chat.adapter.formatted_name
end

local function codecompanion_current_model_name()
  local chat = require("codecompanion").buf_get_chat(vim.api.nvim_get_current_buf())
  if not chat then
    return nil
  end

  return chat.settings.model
end
-- This file contains the configuration for various UI-related plugins in Neovim.
return {
  -- Plugin: folke/todo-comments.nvim
  { "folke/todo-comments.nvim", version = "*" },

  -- Plugin: folke/which-key.nvim
  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     preset = "classic",
  --     win = { border = "single" },
  --   },
  -- },

  -- Plugin: nvim-docs-view
  {
    "amrbashir/nvim-docs-view",
    lazy = true,
    cmd = "DocsViewToggle",
    opts = {
      position = "right",
      width = 60,
    },
  },

  -- Plugin: lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    opts = {
      options = {
        theme = "gentleman-kanagawa-blur",
        icons_enabled = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icon = "󱗞",
          },
        },
        lualine_z = {
          function()
            return " " .. os.date("%I:%M %p")
          end,
        },
      },
      extensions = {
        "quickfix",
        {
          filetypes = { "oil" },
          sections = {
            lualine_a = { mode },
            lualine_b = {
              function()
                local ok, oil = pcall(require, "oil")
                if not ok then
                  return ""
                end
                local path = vim.fn.fnamemodify(oil.get_current_dir(), ":~")
                return "󰉋 " .. path .. " %m"
              end,
            },
          },
        },
        { filetypes = { "codecompanion" }, sections = { lualine_a = { mode }, lualine_b = { codecompanion_adapter_name }, lualine_c = { codecompanion_current_model_name }, lualine_x = {}, lualine_y = { "progress" }, lualine_z = { "location" } }, inactive_sections = { lualine_a = {}, lualine_b = { codecompanion_adapter_name }, lualine_c = {}, lualine_x = {}, lualine_y = { "progress" }, lualine_z = {} } },
      },
    },
  },

  -- Plugin: incline.nvim
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
      require("mini.icons").setup()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = { cursorline = true },
        ignore = {
          buftypes = { "nofile", "terminal" },
          filetypes = { "oil" },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- Plugin: zen-mode.nvim
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
        twilight = { enabled = true },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  -- Plugin: snacks.nvim
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {},
      image = {},
      picker = {
        exclude = { ".git", "node_modules" },
        matcher = { fuzzy = true, smartcase = true, ignorecase = true, filename_bonus = true },
        sources = {},
      },
      dashboard = {
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
        preset = {
          header = [[

   ██████╗ ██╗   ██╗ ██████╗ ██╗   ██╗███████╗██████╗ ███████╗██╗   ██╗
  ██╔════╝ ██║   ██║██╔════╝ ██║   ██║██╔════╝██╔══██╗██╔════╝██║   ██║
  ██║  ███╗██║   ██║██║  ███╗██║   ██║███████╗██║  ██║█████╗  ██║   ██║
  ██║   ██║██║   ██║██║   ██║██║   ██║╚════██║██║  ██║██╔══╝  ╚██╗ ██╔╝
  ╚██████╔╝╚██████╔╝╚██████╔╝╚██████╔╝███████║██████╔╝███████╗ ╚████╔╝
   ╚═════╝  ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚═════╝ ╚══════╝  ╚═══╝

    ⚡ Code with Passion ⚡

        ]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
