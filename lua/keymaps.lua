-- leader key
vim.g.mapleader = " "

-- escape to jk remap
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape" })

-- Netrw (explorer)
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- move line up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- align display when moving cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- resize window
vim.keymap.set("n", "<A-h>", "<C-w><", { desc = "decrease size vertical window" })
vim.keymap.set("n", "<A-l>", "<C-w>>", { desc = "increase size vertical window" })
vim.keymap.set("n", "<A-k>", "<C-w>+", { desc = "increase size horizontal window" })
vim.keymap.set("n", "<A-j>", "<C-w>-", { desc = "decrease size horizontal window" })
vim.keymap.set("n", "q:", "")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>cfg", "<cmd>e ~/.config/nvim/lua/manager.lua<CR>")

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
