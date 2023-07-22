local gs = require("gitsigns")

gs.setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "[h]unk [s]tage" })
vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[h]unk [u]ndo stage" })
vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "[h]unk [r]eset" })
vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "[h]unk buffer [S]tage" })
vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "[h]unk buffer [R]eset" })
vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "[h]unk [p]review" })
vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "[h]unk [d]iff status" })
vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[t]oggle [b]lame" })
vim.keymap.set("n", "<leader>hD", function()
	gs.diffthis("~")
end, { desc = "[h]unk [D]iff last commit" })
vim.keymap.set("n", "<leader>td", gs.toggle_deleted, { desc = "[t]oggle [d]eleted" })
