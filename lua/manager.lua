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
	-- Vim Tmux Navigator
	{ "christoomey/vim-tmux-navigator", lazy = false },

	-- Autopairs plugin
	{ "windwp/nvim-autopairs", event = "InsertEnter" },

	-- Mini plugins
	{
		{ "echasnovski/mini.comment", version = "*", opts = {} },
		-- { "echasnovski/mini.animate", version = "*", opts = {} },
	},

	-- VSCode like troubles
	{ "folke/trouble.nvim" },

	-- LuaLine status bar
	{ "nvim-lualine/lualine.nvim" },

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
	-- { "navarasu/onedark.nvim", opts = { style = "darker" } },
	{ "rose-pine/neovim", name = "rose-pine" },

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

	-- Lsp setup
	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			"folke/neodev.nvim",
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",

			-- Adds a number of user-friendly snippets
			"rafamadriz/friendly-snippets",
			-- lsp kind icons
			"onsails/lspkind.nvim",
		},
	},

	-- VSCode like explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
})
