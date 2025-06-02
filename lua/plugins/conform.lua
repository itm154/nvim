local slow_format_filetypes = {}

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, { desc = "Disable autoformat-on-save", bang = true })

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, { desc = "Re-enable autoformat-on-save" })

vim.api.nvim_create_user_command("FormatToggle", function(args)
	if args.bang then
		vim.b.disable_autoformat = not vim.b.disable_autoformat
	else
		vim.g.disable_autoformat = not vim.g.disable_autoformat
	end
end, { desc = "Toggle autoformat-on-save", bang = true })

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			if slow_format_filetypes[vim.bo[bufnr].filetype] then
				return
			end
			local function on_format(err)
				if err and err:match("timeout$") then
					slow_format_filetypes[vim.bo[bufnr].filetype] = true
				end
			end
			return { timeout_ms = 200, lsp_fallback = true }, on_format
		end,

		format_after_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			if not slow_format_filetypes[vim.bo[bufnr].filetype] then
				return
			end
			return { lsp_fallback = true }
		end,

		formatters_by_ft = {
			bash = { "shellcheck", "shellharden", "shfmt", stop_after_first = true },
			c = { "clang_format" },
			cmake = { "cmake-format" },
			cpp = { "clang_format" },
			cs = { "csharpier" },
			css = { "stylelint" },
			fish = { "fish_indent" },
			javascript = {
				"prettierd",
				"prettier",
				timeout_ms = 2000,
				stop_after_first = true,
			},
			json = { "jq" },
			lua = { "stylua" },
			markdown = { "deno_fmt" },
			nix = { "nixfmt" },
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "isort", "black" }
				end
			end,
			rust = { "rustfmt" },
			sh = { "shellcheck", "shellharden", "shfmt", stop_after_first = true },
			sql = { "sqlfluff" },
			toml = { "taplo" },
			typescript = {
				"prettierd",
				"prettier",
				timeout_ms = 2000,
				stop_after_first = true,
			},
			xml = { "xmlformat", "xmllint", stop_after_first = true },
			yaml = { "yamlfmt" },
			["_"] = { "trim_whitespace", lsp_format = "prefer" },
		},

		formatters = {
			["cmake-format"] = { command = "cmake-format" },
			csharpier = { command = "csharpier" },
			deno_fmt = { command = "deno" },
			isort = { command = "isort" },
			jq = { command = "jq" },
			nixfmt = { command = "nixfmt" },
			prettierd = { command = "prettierd" },
			rustfmt = { command = "rustfmt" },
			shellcheck = { command = "shellcheck" },
			shfmt = { command = "shfmt" },
			shellharden = { command = "shellharden" },
			stylelint = { command = "stylelint" },
			stylua = { command = "stylua" },
			taplo = { command = "taplo" },
			xmlformat = { command = "xmlformat" },
			yamlfmt = { command = "yamlfmt" },
		},
	},
}
