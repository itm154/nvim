return {
	"echasnovski/mini.cursorword",
	version = "*",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		delay = 100,
		disabled_filetypes = {
			"Neotree",
			"TelescopePrompt",
			"alpha",
			"lazy",
			"help",
		},
	},
}
