local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Harpoon theprimeagen plugin
	{ "theprimeagen/harpoon" },
	-- Vim Tmux Navigator
	{ "christoomey/vim-tmux-navigator", lazy = false },

	-- Autopairs plugin
	{ "windwp/nvim-autopairs", event = "InsertEnter" },

	-- Mini plugins
	{
		{ "echasnovski/mini.comment", version = "*", opts = {} },
	},

	-- VSCode like troubles
	{ "folke/trouble.nvim" },

	-- Formatting plugin
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- Git plugins
	{ "tpope/vim-fugitive" },
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
	},

	-- Telescope
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	-- OneDark colorscheme
	{ "navarasu/onedark.nvim", opts = { style = "darker" } },
	-- { "rose-pine/neovim", name = "rose-pine" },

	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		version = "*",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"onsails/lspkind.nvim",

			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",

			-- For neovim config lsp
			"folke/neodev.nvim",
		},
	},
})
