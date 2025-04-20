return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"lukas-reineke/lsp-format.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- Format on save
			require("lsp-format").setup({})

			-- NOTE: Put LSP Configurations here, make sure the LSP server is installed with mason
			local servers = {
				marksman = {},
				jdtls = {},
				clangd = {},
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
			}

			-- Enable inlay hints (requires neovim 0.10+)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						vim.lsp.inlay_hint.enable(true)
					end
				end,
			})

			for server, opts in pairs(servers) do
				lspconfig[server].setup(vim.tbl_deep_extend("force", {
					on_attach = require("lsp-format").on_attach,
				}, opts))
			end
		end,
	},

	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"marksman",
					"jdtls",
					"clangd",
					"lua_ls",
				},
				automatic_installation = true,
			})
		end,
	},
}
