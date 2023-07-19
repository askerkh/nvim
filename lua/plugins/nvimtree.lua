local gheight = vim.api.nvim_list_uis()[1].height
local gwidth = vim.api.nvim_list_uis()[1].width
local width = 70
local height = 20

local api = require("nvim-tree.api")

Map("n", "<leader>e", api.tree.toggle, { desc = "File [e]xplorer" })

require("nvim-tree").setup({
	disable_netrw = true,
	auto_reload_on_write = true,
	view = {
		centralize_selection = true,
		width = 30,
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 70,
				height = 20,
				row = (gheight - height) * 0.5,
				col = (gwidth - width) * 0.5,
			},
		},
	},
	filters = {
		dotfiles = true,
	},
})
