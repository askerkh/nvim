require("neodev").setup({})

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"html",
		"cssls",
		"tsserver",
		"gopls",
		"eslint",
		"jsonls",
		"svelte",
		"tailwindcss",
	},
})

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	Map("n", "gd", function()
		vim.lsp.buf.definition()
	end, { table.unpack(opts), desc = "[g]o to [d]efinition" })
	Map("n", "K", function()
		vim.lsp.buf.hover()
	end, { table.unpack(opts), desc = "Variable info" })
	Map("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, { table.unpack(opts), desc = "[c]ode [a]ctions" })
	Map("n", "<leader>rr", require("telescope.builtin").lsp_references, { table.unpack(opts), desc = "[r]efe[r]ences" })
	Map("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, { table.unpack(opts), desc = "[r]e[n]ame" })
	Map("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, { table.unpack(opts), desc = "signature help" })
end

local lc = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lc.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lc.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lc.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lc.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lc.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lc.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lc.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lc.svelte.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lc.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			validate = true,
		},
	},
})
