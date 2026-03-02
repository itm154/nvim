return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		options = {
			parsers = {
				css_fn = true,
				tailwind = {
					enable = true,
					lsp = true,
				},
				sass = { enable = true },
			},
		},
	},
}
