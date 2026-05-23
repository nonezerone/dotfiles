-- File explore
vim.keymap.set("n", "<space>pv", vim.cmd.Sex)

-- Move selected line upwards & downwards
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Indent
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })

-- Add next line to the end of the current line
vim.keymap.set("n", "J", "mzJ`z")

-- Leap upwards & downwards + center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Cycle through lates search pattern in normal mode
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without wasting pase buffer
vim.keymap.set("x", "<space>p", [["_dP]])

-- Yanking
vim.keymap.set({ "n", "v" }, "<space>y", [["+y]])
vim.keymap.set("n", "<space>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<space>d", [["_d]])

-- Blasphemy
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Noquit
vim.keymap.set("n", "Q", "<nop>")

-- Move through quickfix entries
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<space>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<space>j", "<cmd>lprev<CR>zz")

-- Activate replace pattern command
vim.keymap.set("n", "<space>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Grant executable permission to current file
vim.keymap.set("n", "<space>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<space>trn", function()
  vim.o.relativenumber = not vim.o.relativenumber
end)

vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end)

-- Escape from term
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Source current file
vim.keymap.set("n", "<space><space>", function() vim.cmd("so") end)
