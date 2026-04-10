vim.lsp.enable("rust_analyzer") -- rust
vim.lsp.enable("lua_ls") -- Lua
vim.lsp.enable("tinymist") -- Typst
vim.lsp.enable("ruff") -- python (linter)
vim.lsp.enable("basedpyright") -- python

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})
