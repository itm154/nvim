return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		{
			"onsails/lspkind.nvim",
			opts = {
				mode = "symbol_text",
				symbol_map = {
					Text = "󰊄",
					Method = " ",
					Function = "󰡱 ",
					Constructor = " ",
					Field = " ",
					Variable = "󱀍 ",
					Class = " ",
					Interface = " ",
					Module = "󰕳 ",
					Property = " ",
					Unit = " ",
					Value = " ",
					Enum = " ",
					Keyword = " ",
					Snippet = " ",
					Color = " ",
					File = "",
					Reference = " ",
					Folder = " ",
					EnumMember = " ",
					Constant = " ",
					Struct = " ",
					Event = " ",
					Operator = " ",
					TypeParameter = " ",
				},
				maxwidth = 50,
				ellipsis_char = "...",
			},
		},
	},
	opts = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		return {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<Tab>"] = function(fallback)
					local col = vim.fn.col(".") - 1
					if cmp.visible() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
					elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
						fallback()
					else
						fallback()
					end
				end,
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "emoji" },
				{
					name = "buffer",
					keyword_length = 3,
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
				{ name = "path", keyword_length = 3 },
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = require("lspkind").symbol_map,
					menu = {
						buffer = "[Buf]",
						nvim_lsp = "[LSP]",
						path = "[Path]",
						emoji = "[Emoji]",
						luasnip = "[Snip]",
					},
				}),
			},
			window = {
				completion = { border = "solid" },
				documentation = { border = "solid" },
			},
			experimental = {
				ghost_text = true,
			},
			performance = {
				debounce = 60,
				fetchingTimeout = 200,
				maxViewEntries = 30,
			},
		}
	end,
}
