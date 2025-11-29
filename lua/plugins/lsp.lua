return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"saghen/blink.cmp",
		},
		-- NOTE: Put LSP Configurations here, make sure the LSP server is installed with mason
		opts = {
			servers = {
				tinymist = {
					settings = {
						formatterMode = "typstyle",
						exportPdf = "never",
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							telemetry = { enable = false },
						},
					},
				},
				phpactor = {
					settings = {
						workspace_required = false,
					},
				},

				basedpyright = {
					settings = {
						disableOrganizeImports = true,
						basedpyright = {
							analysis = {
								-- ignore = { "*" },
								typeCheckingMode = "standard",
								diagnosticMode = "openFilesOnly",
								useLibraryCodeForTypes = true,
							},
						},
					},
				},
			},
		},

		config = function()
			vim.lsp.enable("rust_analyzer") -- rust
			vim.lsp.enable("lua_ls") -- lua
			vim.lsp.enable("tinymist") -- typst
			vim.lsp.enable("phpactor") -- php
			vim.lsp.enable("ruff") -- python
			vim.lsp.enable("basedpyright") -- python
		end,
	},

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"tinymist",
				"clangd",
			},
		},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
