vim.lsp.enable("lua_ls") -- Lua
vim.lsp.enable("tinymist") -- Typst
vim.lsp.enable("ruff") -- python (linter)
-- vim.lsp.enable("basedpyright") -- python
vim.lsp.enable("ty") -- python
vim.lsp.enable("nixd") -- nix

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})
