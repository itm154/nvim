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

local prettier = { "prettierd", "prettier", stop_after_first = true }
local shell = { "shellcheck", "shellharden", "shfmt", stop_after_first = true }

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
			-- Web Dev
			javascript = prettier,
			typescript = prettier,
			javascriptreact = prettier,
			typescriptreact = prettier,
			svelte = { lsp_format = "prefer" },
			astro = { lsp_format = "prefer" },
			css = prettier,
			html = prettier,

			-- Key-Value Languages
			json = { "jq" },
			yaml = { "yamlfmt" },
			toml = { "taplo" },

			-- Systems & Scripting
			lua = { "stylua" },
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "isort", "black" }
				end
			end,
			rust = { "rustfmt" },
			bash = shell,
			sh = shell,
			fish = { "fish_indent" },

			-- Systems Programming Language
			c = { "clang_format" },
			cpp = { "clang_format" },
			java = { lsp_format = "prefer" },

			-- Docs & Others
			markdown = { "deno_fmt" },
			sql = { "sqlfluff" },
			xml = { "xmlformat", "xmllint", stop_after_first = true },
			["_"] = { "trim_whitespace" },
		},

		-- Formatter Overrides
		formatters = {
			deno_fmt = { command = "deno", args = { "fmt", "-" } },
			prettier = { timeout_ms = 2000 },
			prettierd = { timeout_ms = 2000 },
		},
	},
}
