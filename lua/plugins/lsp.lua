local lsp = require("lsp-zero")

local luasnip = require("luasnip")

luasnip.filetype_extend("typescriptreact", { "html" })

lsp.preset("recommended")


lsp.ensure_installed({
	"tsserver",
	"eslint",
	"tailwindcss",
	"cssls",
	"lua_ls",
  "jsonls"
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

require("neodev").setup({})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = require("lspkind").cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rr", require("telescope.builtin").lsp_references, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

require('lspconfig').jsonls.setup({
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = false,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])
