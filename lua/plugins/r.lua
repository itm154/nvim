return {
	"R-nvim/R.nvim",
	lazy = false,
	config = function()
		---@type RConfigUserOpts
		local opts = {
			-- This requires kitty to be launched with "kitty -1 --instance-group "kitty_sock" -o allow_remote_control=yes --listen-on unix:/tmp/kitty_sock"
			external_term = "/usr/bin/kitten @ --to unix:/tmp/kitty_sock launch --type tab --keep-focus --cwd=current",
			R_args = { "--quiet", "--no-save" },
			auto_quit = true,
		}
		-- Check if the environment variable "R_AUTO_START" exists.
		-- If using fish shell, you could put in your config.fish:
		-- alias r "R_AUTO_START=true nvim"
		if vim.env.R_AUTO_START == "true" then
			opts.auto_start = "on startup"
			opts.objbr_auto_start = true
		end

		require("r").setup(opts)
	end,
}
