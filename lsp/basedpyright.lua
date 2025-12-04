vim.lsp.config("basedpyright", {
	settings = {
		disableOrganizeImports = true,
		basedpyright = {
			analysis = {
				typeCheckingMode = "standard",
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
})
