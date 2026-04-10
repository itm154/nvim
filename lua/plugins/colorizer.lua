return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		options = {
			parsers = {
				css = true,
				tailwind = {
					enable = true,
					lsp = true,
				},
				sass = { enable = true },
				lsp = true,
			},
		},
	},
}
