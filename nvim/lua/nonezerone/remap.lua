-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected line upwards & downwards
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Add next line to the end of the current line
vim.keymap.set("n", "J", "mzJ`z")

-- Leap upwards & downwards + center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Cycle through lates search pattern in normal mode
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without wasting pase buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yanking
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Blasphemy
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Noquit
vim.keymap.set("n", "Q", "<nop>")

-- Change session with tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- LSP autoformat
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Something locations
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Activate replace pattern command
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Grant executable permission to current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>trn", function()
    vim.o.relativenumber = not vim.o.relativenumber
end)

-- Source current file
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end)
