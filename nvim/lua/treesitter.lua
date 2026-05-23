local treesitter = require("nvim-treesitter")

local ensure_installed = {
  "ruby", "python", "go", "rust",
  "typescript", "javascript", "tsx",
  "html", "css", "json", "bash",
  "http", "dockerfile",
}

treesitter.install(ensure_installed)
treesitter.setup({
  endwise = { enable = true },
  indent = { enable = true }
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype

    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    local ok_add = pcall(vim.treesitter.language.add, lang)
    if not ok_add then
      return
    end

    pcall(vim.treesitter.start, buf, lang)
  end,
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
