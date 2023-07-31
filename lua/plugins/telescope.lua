local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"package*",
		},
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
		layout_config = {
			horizontal = {
				preview_cutoff = 0,
			},
		},
	},
})

vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[f]ind [f]iles" })
vim.keymap.set("n", "<leader>sg", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "[s]earch [g]ord" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[s]earch [b]uffers" })
