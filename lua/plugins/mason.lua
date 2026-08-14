if vim.g.is_nix then
	return {}
end

return {
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"mason-org/mason.nvim",
				build = ":MasonUpdate",
				config = true,
			},
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Core/Lua
					"lua_ls",

					-- -- Web Development
					-- "html",
					-- "cssls",
					-- "ts_ls",
					-- "svelte",
					-- "tailwindcss",
					-- "emmet_ls",
					--
					-- -- Systems & Scripting
					-- "bashls",
					-- "basedpyright",
					-- "rust_analyzer",
					-- "clangd",
					--
					-- -- Data & Config
					-- "jsonls",
					-- "yamlls",
					-- "taplo",
					-- "marksman",
				},
				handlers = {
					function(server_name)
						local capabilities = require("blink.cmp").get_lsp_capabilities()
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,
				},
			})
		end,
	},
}
