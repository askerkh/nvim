require("trouble").setup({})

vim.keymap.set("n", "<leader>tt", function()
	vim.cmd("TroubleToggle")
end, { desc = "[t]oggle [t]rouble" })
