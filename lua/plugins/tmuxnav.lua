Map("n", "<C-l>", function()
	vim.cmd("TmuxNavigateRight")
end, { desc = "navigate right tmux" })

Map("n", "<C-h>", function()
	vim.cmd("TmuxNavigateLeft")
end, { desc = "navigate left tmux" })

Map("n", "<C-j>", function()
	vim.cmd("TmuxNavigateDown")
end, { desc = "navigate down tmux" })

Map("n", "<C-k>", function()
	vim.cmd("TmuxNavigateUp")
end, { desc = "navigate up tmux" })
