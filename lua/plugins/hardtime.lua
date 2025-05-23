return {
	"m4xshen/hardtime.nvim",
	lazy = false,
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		disabled_keys = {
			-- Disable warnings on these because I have mapped arrow keys to HJKL
			-- Used for choosing LSP completions
			["<Up>"] = false, -- Allow <Up> key
			["<Down>"] = false, -- Allow <Down> key
			["<Space>"] = { "n", "x" }, -- Disable <Space> key in normal and visual mode
			disabled_filetypes = {
				lazy = false, -- Enable Hardtime in lazy filetype
			},
		},
	},
}
