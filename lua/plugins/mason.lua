return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				-- Core/Lua
				"lua_ls",

				-- Web Development
				"html",
				"cssls",
				"ts_ls",
				"svelte",
				"tailwindcss",
				"emmet_ls",

				-- Systems & Scripting
				"bashls",
				"basedpyright",
				"rust_analyzer",
				"clangd",

				-- Data & Config
				"jsonls",
				"yamlls",
				"taplo",
				"marksman",
			},
		},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
