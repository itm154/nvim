return {
	"chomosuke/typst-preview.nvim",
	ft = "typst",
	version = "1.*",
	opts = {
		dependencies_bin = {
			["tinymist"] = "tinymist",
			["websocat"] = "/usr/bin/websocat",
		},

		port = 12354,
	},
}
