require("trouble").setup({})

Map("n", "<leader>tt", function()
	vim.cmd("TroubleToggle")
end, { desc = "[t]oggle [t]rouble" })
