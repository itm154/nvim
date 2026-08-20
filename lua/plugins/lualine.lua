return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "", right = "" }, icon = "" },
				},
				lualine_b = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
				},
				lualine_c = {},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						update_in_insert = true,
					},
				},
				lualine_y = {
					{ "branch", icon = "" },
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						colored = true,
					},
				},
				lualine_z = {
					{ "location", separator = { left = "", right = "" }, icon = "" },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			extensions = { "trouble" },
		})
	end,
}
