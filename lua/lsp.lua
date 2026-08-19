local servers = {
	-- Must haves
	"lua_ls",
	"nixd",

	-- Python
	"basedpyright",
	"ruff",
}

for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})
