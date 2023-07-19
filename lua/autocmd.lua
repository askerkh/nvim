local namespace = vim.api.nvim_create_namespace("class_conceal")
local group = vim.api.nvim_create_augroup("class_conceal", { clear = true })

local queries = {
	class = [[
    ((attribute
        (attribute_name) @att_name (#eq? @att_name "class")
        (quoted_attribute_value (attribute_value) @class_value) (#set! @class_value conceal "…")))
  ]],
	className = [[
    ((attribute
        (attribute_name) @att_name (#eq? @att_name "className")
        (quoted_attribute_value (attribute_value) @class_value) (#set! @class_value conceal "…")))
  ]],
}

local concealHtmlClass = function(bufnr, variant)
	local language_tree = vim.treesitter.get_parser(bufnr, "html")
	local syntax_tree = language_tree:parse()
	local root = syntax_tree[1]:root()

	local query = vim.treesitter.query.parse("html", queries[variant])

	for _, captures, metadata in query:iter_matches(root, bufnr, root:start(), root:end_()) do
		local start_row, start_col, end_row, end_col = captures[2]:range()
		vim.api.nvim_buf_set_extmark(bufnr, namespace, start_row, start_col, {
			end_line = end_row,
			end_col = end_col,
			conceal = metadata[2].conceal,
		})
	end
end

local conceals = {
	{ pattern = "*.html", variant = "class" },
	{ pattern = "*.svelte", variant = "class" },
	{ pattern = "*.tsx", variant = "className" },
	{ pattern = "*.jsx", variant = "className" },
}

for _, v in pairs(conceals) do
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }, {
		group = group,
		pattern = v.pattern,
		callback = function()
			concealHtmlClass(vim.api.nvim_get_current_buf(), v.variant)
		end,
	})
end
