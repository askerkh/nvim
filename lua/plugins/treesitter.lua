local ts = require("nvim-treesitter.configs")

local opts = {
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  ensure_installed = {
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "query",
    "regex",
    "tsx",
    "typescript",
    "go",
  },
}

ts.setup(opts)
