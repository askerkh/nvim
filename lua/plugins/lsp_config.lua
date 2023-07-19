local servers = {
	"lua_ls",
	"html",
	"cssls",
	"tsserver",
	"gopls",
	"eslint",
	"jsonls",
	"svelte",
	"tailwindcss",
}

require("neodev").setup({})

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local on_attach = function(_, bufnr)
	Map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "[g]o to [d]efinition" })
	Map("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Variable info" })
	Map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "[c]ode [a]ctions" })
	Map("n", "<leader>rr", require("telescope.builtin").lsp_references, { buffer = bufnr, desc = "[r]efe[r]ences" })
	Map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "[r]e[n]ame" })
	Map("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "signature help" })
end

local lc = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in ipairs(servers) do
	lc[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
