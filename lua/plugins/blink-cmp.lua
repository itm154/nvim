return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},

	version = "1.*",
	opts = {
		keymap = {
			preset = "super-tab",
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = false,
			},
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},

		snippets = {
			preset = "luasnip",
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
	},
	opts_extend = { "sources.default" },
}
