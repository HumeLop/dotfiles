return {
  -- Change configuration for trouble.nvim
  {
    -- Plugin: trouble.nvim
    -- URL: https://github.com/folke/trouble.nvim
    -- Description: A pretty list for showing diagnostics, references, telescope results, quickfix and location lists.
    "folke/trouble.nvim",
    -- Options to be merged with the parent specification
    opts = { use_diagnostic_signs = true }, -- Use diagnostic signs for trouble.nvim
  },

  -- Add symbols-outline.nvim plugin
  {
    -- Plugin: symbols-outline.nvim
    -- URL: https://github.com/simrat39/symbols-outline.nvim
    -- Description: A tree like view for symbols in Neovim using the Language Server Protocol.
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",                                                           -- Command to open the symbols outline
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } }, -- Keybinding to open the symbols outline
    config = true,                                                                    -- Use default configuration
  },

  -- Ensure nil_ls is not installed by mason-lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ignore_installed = { "nil_ls" },
    },
  },

  -- Remove inlay hints from default configuration
  {
    -- Plugin: nvim-lspconfig
    -- URL: https://github.com/neovim/nvim-lspconfig
    -- Description: Quickstart configurations for the Neovim LSP client.
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Load earlier for LSP support
    opts = function(_, opts)
      -- Get capabilities from blink.cmp if available
      local has_blink, blink = pcall(require, "blink.cmp")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      if has_blink then
        capabilities = vim.tbl_deep_extend(
          "force",
          capabilities,
          blink.get_lsp_capabilities()
        )
      end

      -- Set default options for all servers
      opts.inlay_hints = { enabled = false } -- Disable inlay hints
      opts.diagnostics = {
        virtual_text = { spacing = 4 },
        update_in_insert = false,
      }

      -- Initialize opts.servers if it doesn't exist
      opts.servers = opts.servers or {}

      -- Apply capabilities to all servers
      for _, server_opts in pairs(opts.servers) do
        server_opts.capabilities = capabilities
      end

      -- Specific server configurations
      opts.servers.angularls = vim.tbl_deep_extend(
        "force",
        opts.servers.angularls or {},
        {
          -- Configuration for Angular Language Server
          capabilities = capabilities,
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("angular.json", "project.json")(fname)
          end,
        }
      )

      opts.servers.nil_ls = vim.tbl_deep_extend(
        "force",
        opts.servers.nil_ls or {},
        {
          -- Configuration for nil (Nix Language Server), already installed via nix
          capabilities = capabilities,
          cmd = { "nil" },
          autostart = true,
          mason = false, -- Explicitly disable mason management for nil_ls
          settings = {
            ["nil"] = {
              formatting = { command = { "nixpkgs-fmt" } },
            },
          },
        }
      )

      return opts
    end,
  },
}
