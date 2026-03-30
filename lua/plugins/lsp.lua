return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"saghen/blink.cmp",
		},
		keys = {
			{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
			{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Go to references" },
			{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
			{ "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
			{ "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Go to type definition" },
			{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover documentation" },
			{ "<leader>cw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", desc = "Workspace symbol" },
			{ "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename symbol" },
			{ "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line diagnostics" },
			{ "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic" },
			{ "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous diagnostic" },
		},
	},
}
