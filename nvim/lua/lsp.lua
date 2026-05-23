require("mason").setup()

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Local buffer" })
vim.keymap.set("n", "vd", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.diagnostic.config({ virtual_text = false })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        disable = { "missing-fields" }
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        }
      }
    },
  },
})

vim.lsp.config("emmet_ls", {
  settings = {
    filetypes = {
      "html",
      "css",
      "eruby",
      "javascript",
    }
  }
})

vim.lsp.config("ruby_lsp", {
  settings = {
    init_options = {
      formatting = false,
      formatter = "standard",
      linters = { "standard" },
    }
  }
})

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "off",
      }
    }
  }
})

vim.lsp.enable({
  "lua_ls",
  "ruby_lsp",
  "emmet_ls",
  "ts_ls",
  "gopls",
  "rust_analyzer",
  "ruff",
  "bashls",
  "basedpyright",
})
