vim.g.gruvbox_bold = 0
vim.g.gruvbox_contrast_dark = "hard"

vim.cmd.colorscheme("gruvbox")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
