local palette = require("catppuccin.palettes").get_palette()

-- Solid background Telescope highlights using Catppuccin colors
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = palette.mantle, fg = palette.text })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = palette.mantle, fg = palette.mantle, bold = true })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = palette.surface0 })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = palette.surface0, fg = palette.surface0 })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = palette.mantle })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = palette.mantle, fg = palette.mantle })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = palette.mantle })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = palette.mantle, fg = palette.mantle })

-- Add a background color for section titles like "Find Files" and "Results"
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = palette.red, fg = palette.base })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = palette.green, fg = palette.base })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = palette.green, fg = palette.base })

-- Adjust border thickness and layout for NvChad style
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			prompt_prefix = "   ",
			selection_caret = " ",
			entry_prefix = " ",
			sorting_strategy = "ascending",
			results_title = false,
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				width = 0.87,
				height = 0.80,
			},
			-- Set border characters to make it thicker (matching NvChad style)
			borderchars = { "┏", "━", "┛", "┃", "┏", "━", "┛", "┃" }, -- Thicker border
		},
	},
}
