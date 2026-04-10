return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	branch = "main",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local ts = require("nvim-treesitter")
		local languages = {
			-- -- Core & Neovim
			-- "lua",
			-- "luadoc",
			-- "luap",
			-- "vim",
			-- "vimdoc",
			-- "query",
			--
			-- -- Web Development
			-- "html",
			-- "css",
			-- "javascript",
			-- "typescript",
			-- "tsx",
			-- "svelte",
			--
			-- -- Systems & Scripting
			-- "bash",
			-- "c",
			-- "cpp",
			-- "python",
			-- "nix",
			-- "rust",
			--
			-- -- Data, Config & Docs
			-- "json",
			-- "yaml",
			-- "toml",
			-- "markdown",
			-- "markdown_inline",
			-- "regex",
			--
			-- -- R & Scientific Writing
			-- "r",
			-- "rnoweb",
			-- "latex",
			-- "typst",
		}
		-- State tracking for async parser loading
		local parsers_loaded = {}
		local parsers_pending = {}
		local parsers_failed = {}

		local ns = vim.api.nvim_create_namespace("treesitter.async")

		-- Helper to start highlighting and indentation
		local function start(buf, lang)
			local ok = pcall(vim.treesitter.start, buf, lang)
			if ok then
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
			return ok
		end

		-- Install core parsers after lazy.nvim finishes loading all plugins
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyDone",
			once = true,
			callback = function()
				ts.install(languages, { max_jobs = 8 })
			end,
		})

		vim.api.nvim_set_decoration_provider(ns, {
			on_start = vim.schedule_wrap(function()
				if #parsers_pending == 0 then
					return false
				end
				for _, data in ipairs(parsers_pending) do
					if vim.api.nvim_buf_is_valid(data.buf) then
						if start(data.buf, data.lang) then
							parsers_loaded[data.lang] = true
						else
							parsers_failed[data.lang] = true
						end
					end
				end
				parsers_pending = {}
			end),
		})

		local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

		local ignore_filetypes = {
			"checkhealth",
			"lazy",
			"mason",
			"neo-tree",
			"trouble",
			"lazy_backdrop",
			"cmd",
			"dialog",
			"msg",
			"pager",
		}

		-- Auto-install parsers and enable highlighting on FileType
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			desc = "Enable treesitter highlighting and indentation (non-blocking)",
			callback = function(event)
				if vim.tbl_contains(ignore_filetypes, event.match) then
					return
				end

				local lang = vim.treesitter.language.get_lang(event.match) or event.match
				local buf = event.buf

				if parsers_failed[lang] then
					return
				end

				if parsers_loaded[lang] then
					-- Parser already loaded, start immediately (fast path)
					start(buf, lang)
				else
					-- Queue for async loading
					table.insert(parsers_pending, { buf = buf, lang = lang })
				end

				-- Auto-install missing parsers (async, no-op if already installed)
				ts.install({ lang })
			end,
		})
	end,
}
