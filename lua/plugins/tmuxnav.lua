vim.keymap.set("n", "<C-l>", function()
	vim.cmd("TmuxNavigateRight")
end, { desc = "navigate right tmux" })

vim.keymap.set("n", "<C-h>", function()
	vim.cmd("TmuxNavigateLeft")
end, { desc = "navigate left tmux" })

vim.keymap.set("n", "<C-j>", function()
	vim.cmd("TmuxNavigateDown")
end, { desc = "navigate down tmux" })

vim.keymap.set("n", "<C-k>", function()
	vim.cmd("TmuxNavigateUp")
end, { desc = "navigate up tmux" })
