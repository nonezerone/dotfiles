return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim", opts = {} },
        { 'folke/neodev.nvim', opts = {} },
    },

    config = function()
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
                map("[d", vim.diagnostic.goto_next)
                map("]d", vim.diagnostic.goto_prev)
            end
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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
            tsserver = {},
            gopls = {},
            pylsp = {},
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua', -- Used to format Lua code
        })
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
