local treesitter = require("nvim-treesitter")

local ensure_installed = {
  "ruby", "python", "go", "rust",
  "typescript", "javascript", "tsx",
  "html", "css", "json", "bash",
  "http", "dockerfile",
}

treesitter.install(ensure_installed)
treesitter.setup({})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end
})
