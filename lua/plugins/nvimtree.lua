local api = require("nvim-tree.api")

Map("n", "<leader>e", api.tree.toggle, { desc = "File [e]xplorer" })

require("nvim-tree").setup({
	disable_netrw = true,
	auto_reload_on_write = true,
	view = {
		centralize_selection = true,
		width = 25,
	},
	filters = {
		dotfiles = true,
	},
})
