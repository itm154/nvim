return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"saghen/blink.cmp",
		},
		keys = {
			{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
			{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
			{ "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
			{ "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Go to type definition" },
			{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover documentation" },
			{ "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic" },
			{ "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous diagnostic" },
		},
	},
}
