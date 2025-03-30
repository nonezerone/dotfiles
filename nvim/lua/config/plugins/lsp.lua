return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim", opts = {} },
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

    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = {
                            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                            disable = { "missing-fields" },
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
                        formatter = false,
                    },
                },
            },
            ts_ls = {},
            gopls = {},
            pylsp = {},
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        -- vim.list_extend(ensure_installed, {
        --     'stylua', -- Used to format Lua code
        -- })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        }
    end,
}
