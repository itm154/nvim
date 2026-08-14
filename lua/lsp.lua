-- Must haves
vim.lsp.enable("lua_ls")
vim.lsp.enable("nixd")

-- Others
vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})
