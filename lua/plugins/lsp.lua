return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"saghen/blink.cmp",
		},
		keys = {
			{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "LSP: Go to Definition" },
			{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "LSP: Go to Declaration" },
			{ "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "LSP: Go to Implementation" },
			{ "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "LSP: Go to Type Definition" },
			{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "LSP: Hover Documentation" },
			{ "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "LSP: Next Diagnostic" },
			{ "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "LSP: Previous Diagnostic" },
			{
				"<leader>ud",
				function()
					local current = vim.diagnostic.config().virtual_text
					vim.diagnostic.config({ virtual_text = not current })
				end,
				desc = "LSP: Toggle Inline Diagnostics",
			},
		},
	},
}
