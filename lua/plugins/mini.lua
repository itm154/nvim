return {
	{
		"nvim-mini/mini.comment",
		version = "*",
		opts = {},
	},
	{
		"nvim-mini/mini.cursorword",
		version = "*",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			delay = 100,
			disabled_filetypes = {
				"neo-tree-preview",
				"TelescopePrompt",
				"alpha",
				"lazy",
				"help",
			},
		},
	},
	{
		"nvim-mini/mini.indentscope",
		version = "*",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			symbol = "│", -- The symbol to represent the indentation level
			options = {
				try_as_border = true, -- Try to use indentation as a border in certain cases
			},
			-- Disable for specific filetypes
			disabled_filetypes = {
				"neo-tree-preview",
				"TelescopePrompt",
				"alpha",
				"help",
			},
		},
	},
	{
		"nvim-mini/mini.move",
		version = "*",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"nvim-mini/mini.surround",
		version = "*",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"nvim-mini/mini.icons",
		config = function(_, opts)
			local mini_icons = require("mini.icons")
			local mock_nvim_web_devicons = opts.mock_nvim_web_devicons
			opts.mock_nvim_web_devicons = nil
			mini_icons.setup(opts)

			if mock_nvim_web_devicons then
				mini_icons.mock_nvim_web_devicons()
			end
		end,
	},
}
