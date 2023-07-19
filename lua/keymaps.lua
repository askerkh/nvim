-- remap abstraction function
function Map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- leader key
vim.g.mapleader = " "

-- escape to jk remap
Map("i", "jk", "<Esc>", { desc = "Escape" })

-- move line up and down in visual mode
Map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "move line down (visual mode)" })
Map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move line down (visual mode)" })

-- align display when moving cursor
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")
Map("n", "n", "nzzzv")
Map("n", "N", "Nzzzv")

-- resize window
Map("n", "<A-h>", "<C-w><", { desc = "decrease size vertical window" })
Map("n", "<A-l>", "<C-w>>", { desc = "increase size vertical window" })
Map("n", "<A-k>", "<C-w>+", { desc = "increase size horizontal window" })
Map("n", "<A-j>", "<C-w>-", { desc = "decrease size horizontal window" })
Map("n", "q:", "")

-- navigating
Map("n", "<C-h>", "<C-w>h", { desc = "navigate to left" })
Map("n", "<C-l>", "<C-w>l", { desc = "navigate to right" })
Map("n", "<C-k>", "<C-w>k", { desc = "navigate to up" })
Map("n", "<C-j>", "<C-w>j", { desc = "navigate to down" })

-- tabs manage
-- map("n", "<leader>to", ":tabedit<cr>")
-- map("n", "<leader>tc", ":tabclose<cr>")
-- map("n", "tn", ":tabnext<CR>")
-- map("n", "tp", ":tabprev<CR>")
