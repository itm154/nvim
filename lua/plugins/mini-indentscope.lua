return {
	"echasnovski/mini.indentscope",
	version = "*",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		symbol = "│", -- The symbol to represent the indentation level
		options = {
			try_as_border = true, -- Try to use indentation as a border in certain cases
		},
		-- Disable for specific filetypes
		disabled_filetypes = {
			"NvimTree",
			"TelescopePrompt",
			"alpha",
			"help",
		},
	},
}
