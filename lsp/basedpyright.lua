return {
	cmd = { "basedpyright" },
	filetypes = { "py" },
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
}
