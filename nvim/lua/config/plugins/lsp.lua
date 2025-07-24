return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    { "j-hui/fidget.nvim",       opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            },
            diagnostics = {
              disable = { "missing-fields" }
            },
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              }
            },
          },
        },
      },
      emmet_ls = {
        settings = {
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
          },
        },
      },
      ruby_lsp = {
        settings = {
          init_options = {
            formatter = 'standard',
            linters = { 'standard' },
          },
        },
      },
      ts_ls = {},
      gopls = {},
      pylsp = {},
      bashls = {},
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspAttachGroup", { clear = true }),
      callback = function(event)
        local map = function(keys, func)
          vim.keymap.set("n", keys, func, { buffer = event.buf })
        end

        map("gd", vim.lsp.buf.definition)
        map("K", vim.lsp.buf.hover)
        map("<leader>vws", vim.lsp.buf.workspace_symbol)
        map("<leader>vd", vim.diagnostic.open_float)
        map("<leader>vca", vim.lsp.buf.code_action)
        map("<leader>vrr", vim.lsp.buf.references)
        map("<leader>vrn", vim.lsp.buf.rename)
      end
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local ensure_installed = vim.tbl_keys(opts.servers or {})
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    for server, settings in pairs(opts.servers) do
      require("lspconfig")[server].setup { settings = settings["settings"] or {}, capabilities = capabilities }
    end
  end,
}
