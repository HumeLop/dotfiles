-- This file contains the configuration for the nvim-dap plugin in Neovim.

return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
    },
    keys = {
      { "<leader>d",  "",                                                                                   desc = "+debug",              mode = { "n", "v" } },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,                                             desc = "Continue" },
      {
        "<leader>da",
        function()
          local args = vim.fn.input("Args: ")
          require("dap").continue({ before = function() return args end })
        end,
        desc = "Run with Args"
      },
      { "<leader>dC", function() require("dap").run_to_cursor() end,    desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end,            desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end,        desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end,             desc = "Down" },
      { "<leader>dk", function() require("dap").up() end,               desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end,         desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end,         desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end,        desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end,            desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end,      desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end,          desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end,        desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
    config = function()
      local dap = require("dap")

      -- Setup mason-nvim-dap if available
      local has_mason_dap, mason_dap = pcall(require, "mason-nvim-dap")
      if has_mason_dap then
        mason_dap.setup()
      end

      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      -- Setup DAP signs
      local dap_icons = {
        Breakpoint = "●",
        BreakpointCondition = "◆",
        BreakpointRejected = "○",
        LogPoint = "◉",
        Stopped = "→",
      }
      for name, sign in pairs(dap_icons) do
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign, texthl = "DiagnosticInfo", linehl = "", numhl = "" }
        )
      end
      local vscode = require("dap.ext.vscode")
      local json = require("plenary.json")
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end
      if vim.fn.filereadable(".vscode/launch.json") then
        vscode.load_launchjs()
      end
      local function load_env_variables()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
          variables[k] = v
        end
        local env_file_path = vim.fn.getcwd() .. "/.env"
        local env_file = io.open(env_file_path, "r")
        if env_file then
          for line in env_file:lines() do
            for key, value in string.gmatch(line, "([%w_]+)=([%w_]+)") do
              variables[key] = value
            end
          end
          env_file:close()
        else
          print("Error: .env file not found in " .. env_file_path)
        end
        return variables
      end
      for _, config in pairs(dap.configurations.go or {}) do
        config.env = load_env_variables
      end
    end,
  },
}
