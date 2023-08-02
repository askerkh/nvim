vim.keymap.set("n", "<leader>e", require("nvim-tree.api").tree.toggle)

require("nvim-tree").setup({
	view = {
		width = 30,
	},
})
