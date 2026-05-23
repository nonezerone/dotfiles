return {
  -- {
  --   "rebelot/kanagawa.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("kanagawa").setup({
  --       commentStyle = { italic = false },
  --       functionStyle = { italic = false },
  --       keywordStyle = { italic = false },
  --       statementStyle = { bold = true },
  --       theme = "dragon",
  --       transparent = false,
  --     })
  --   end,

  --   init = function()
  --     vim.cmd.colorscheme("kanagawa-dragon")
  --   end,
  -- },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 3000,
      set_dark_mode = function()
        vim.cmd("colorscheme vague")
      end,
      set_light_mode = function()
        vim.cmd("colorscheme github_light_default")
      end,
    },
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme'
  },
  {
    "vague-theme/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        bold = true,
        italic = false,
      })
      vim.cmd("colorscheme vague")
    end
  },
}
