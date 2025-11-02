return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = false,
		integrations = {
			fzf = true,
			gitsigns = true,
			illuminate = true,
			lsp_trouble = true,
			mason = true,
			mini = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			neotree = true,
			telescope = true,
			treesitter = true,
			treesitter_context = true,
			which_key = true,
			fzf = true,
		},
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
