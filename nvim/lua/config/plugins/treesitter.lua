return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "jsdoc", "bash", "ruby" },
            sync_install = false,
            auto_install = true,

            indent = {
                enable = true,
                disable = { "ruby" },
            },
            endwise = {
                enable = true,
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
            },
        })

        vim.api.nvim_create_autocmd({"BufReadPost", "FileReadPost", "BufNewFile"}, {
            group = vim.api.nvim_create_augroup("CommonGroup", { clear = true }),
            pattern = { "*.erb", "*.eruby" },
            command = "set syntax=html",
        })
    end
}
