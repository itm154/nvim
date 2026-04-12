return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-mini/mini.icons", opts = { mock_nvim_web_devicons = true } },
	keys = {
		{
			"<leader>fa",
			"<cmd>lua require('fzf-lua').files({ fd_opts = '--color=never --type f --hidden --follow --no-ignore' })<CR>",
			desc = "Find All Files",
		},
		{
			"<leader>fs",
			"<cmd>lua require('fzf-lua').lsp_live_workspace_symbols()<CR>",
			desc = "Workspace Symbols",
		},
		{
			"<leader>fd",
			"<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>",
			desc = "Document Symbols",
		},
		{
			"<leader>fw",
			"<cmd>lua require('fzf-lua').live_grep()<CR>",
			desc = "Live Grep",
		},
		{
			"<leader>fb",
			"<cmd>lua require('fzf-lua').buffers()<CR>",
			desc = "Find Buffers",
		},
		{
			"<leader>fh",
			"<cmd>lua require('fzf-lua').help_tags()<CR>",
			desc = "Help Pages",
		},
		{
			"<leader>fm",
			"<cmd>lua require('fzf-lua').marks()<CR>",
			desc = "Find Marks",
		},
		{
			"<leader>fo",
			"<cmd>lua require('fzf-lua').oldfiles()<CR>",
			desc = "Recent Files",
		},
		{
			"<leader>fc",
			"<cmd>lua require('fzf-lua').git_commits()<CR>",
			desc = "Git Commits",
		},
		{
			"<leader>fg",
			"<cmd>lua require('fzf-lua').git_status()<CR>",
			desc = "Git Status",
		},
		{
			"<leader>ff",
			"<cmd>lua require('fzf-lua').files()<CR>",
			desc = "Find Files",
		},
	},
	opts = {
		backend = "delta",
		backend_opts = {
			delta = {
				header_lines_to_remove = 4,
			},
			args = { "--line-numbers" },
		},

		winopts = {
			border = function(_, m)
				if m.nwin == 1 then
					return { " ", " ", " ", " ", " ", " ", " ", " " }
				end
				if m.layout == "down" or m.layout == "up" then
					return { " ", " ", " ", " ", "", "", "", " " }
				end
				return { " ", " ", "", "", "", " ", " ", " " }
			end,
			preview = {
				default = "bat",
				border = "solid",
				scrollbar = "float",
				scrolloff = "-1",
				title_pos = "center",
			},
			manpages = { previewer = "man_native" },
			helptags = { previewer = "help_native" },
			lsp = { code_actions = { previewer = "codeaction_native" } },
			tags = { previewer = "bat" },
			btags = { previewer = "bat" },
		},
		hls = {
			title = "IncSearch",
		},
		fzf_colors = { true },
	},
}
