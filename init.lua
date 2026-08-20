-- Experimental
require("vim._core.ui2").enable()

require("config.lazy")
require("config.keymaps")
require("config.options")
require("config.autocmds")

-- Load lsp configuration asynchronously
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	once = true,
	callback = function()
		require("lsp")
	end,
})
