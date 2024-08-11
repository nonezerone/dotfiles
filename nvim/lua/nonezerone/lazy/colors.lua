return {

    {
        "rebelot/kanagawa.nvim",
        priority = 1000,

        config = function()
            require("kanagawa").setup({
                commentStyle = { italic = false },
                functionStyle = { italic = false },
                keywordStyle = { italic = false },
                statementStyle = { bold = true },
                theme = "dragon",
            })
        end,

        init = function()
            vim.cmd.colorscheme("kanagawa-dragon")
        end,
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                styles = {
                    italic = false,
                },
            })
        end,

    }
}
