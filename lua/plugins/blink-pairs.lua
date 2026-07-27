return {
	"saghen/blink.pairs",
	event = "InsertEnter",
	version = "*", -- (recommended) only required with prebuilt binaries
	dependencies = "saghen/blink.lib",
	build = function()
		require("blink.pairs").download():pwait(60000)
	end,

	--- @module 'blink.pairs'
	--- @type blink.pairs.Config
	opts = {
		mappings = {
			enabled = true,
			cmdline = true,
			disabled_filetypes = {},
			wrap = {
				["<C-b>"] = "treesitter", -- move closing pair via motion
				["<C-S-b>"] = "treesitter_reverse", -- move opening pair via motion
				-- normal_mode = {} <- for normal mode mappings, only supports 'motion' and 'motion_reverse'
			},
			-- see the defaults:
			-- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L52
			pairs = {},
		},
		highlights = {
			enabled = true, -- requires require('vim._extui').enable({}), otherwise has no effect
			cmdline = true,
			groups = { "BlinkPairsOrange", "BlinkPairsPurple", "BlinkPairsBlue" },
			unmatched_group = "BlinkPairsUnmatched",

			matchparen = {
				enabled = true,
				cmdline = false, -- known issue where typing won't update matchparen highlight, disabled by default
				include_surrounding = false,
				group = "BlinkPairsMatchParen",
				priority = 250,
			},
		},
		debug = false,
	},
}
