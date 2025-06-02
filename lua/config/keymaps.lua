-- Neovim keymaps configuration

-- Set leader key
vim.g.mapleader = " "

-- Define keymaps
local keymaps = {

	-- =====================================
	-- INSERT MODE
	-- =====================================
	{
		mode = "i",
		key = "<C-b>",
		action = "<ESC>^i",
		options = { silent = true, desc = "Move beginning of line" },
	},
	{
		mode = "i",
		key = "<C-e>",
		action = "<End>",
		options = { silent = true, desc = "Move end of line" },
	},
	{
		mode = "i",
		key = "<C-h>",
		action = "<Left>",
		options = { silent = true, desc = "Move left" },
	},
	{
		mode = "i",
		key = "<C-l>",
		action = "<Right>",
		options = { silent = true, desc = "Move right" },
	},
	{
		mode = "i",
		key = "<C-j>",
		action = "<Down>",
		options = { silent = true, desc = "Move down" },
	},
	{
		mode = "i",
		key = "<C-k>",
		action = "<Up>",
		options = { silent = true, desc = "Move up" },
	},

	-- =====================================
	-- NORMAL MODE
	-- =====================================
	{
		mode = "n",
		key = "j",
		action = "v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj'",
		options = { expr = true, silent = true, desc = "Move down" },
	},
	{
		mode = "n",
		key = "k",
		action = "v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk'",
		options = { expr = true, silent = true, desc = "Move down" },
	},
	-- Window navigation
	{
		mode = "n",
		key = "<C-h>",
		action = "<C-w>h",
		options = { silent = true, desc = "Move to left window" },
	},
	{
		mode = "n",
		key = "<C-l>",
		action = "<C-w>l",
		options = { silent = true, desc = "Move to right window" },
	},
	{
		mode = "n",
		key = "<C-j>",
		action = "<C-w>j",
		options = { silent = true, desc = "Move down" },
	},
	{
		mode = "n",
		key = "<C-k>",
		action = "<C-w>k",
		options = { silent = true, desc = "Move up" },
	},
	-- Utility
	{
		mode = "n",
		key = "<Esc>",
		action = "<cmd>noh<CR>",
		options = { silent = true, desc = "Clear highlights" },
	},
	{
		mode = "n",
		key = "<C-s>",
		action = "<cmd>w<CR>",
		options = { silent = false, desc = "Save file" },
	},
	{
		mode = "n",
		key = "<C-c>",
		action = "<cmd>%y+<CR>",
		options = { silent = false, desc = "Copy whole file" },
	},
	{
		mode = "n",
		key = "<leader>n",
		action = "<cmd>set rnu!<CR>",
		options = { silent = true, desc = "Toggle relative line number" },
	},
	{
		mode = "n",
		key = "<leader>x",
		action = "<cmd>bd<CR>",
		options = { silent = true, desc = "Close buffer" },
	},

	-- =====================================
	-- LSP KEYMAPS
	-- =====================================
	-- Show all diagnostics
	{
		mode = "n",
		key = "<leader>tt",
		action = "<cmd>Trouble diagnostics toggle<cr>",
		options = { desc = "Diagnostics (Trouble)" },
	},

	-- Buffer-local diagnostics
	{
		mode = "n",
		key = "<leader>tb",
		action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		options = { desc = "Buffer Diagnostics (Trouble)" },
	},

	-- Workspace symbols
	{
		mode = "n",
		key = "<leader>ts",
		action = "<cmd>Trouble symbols toggle focus=false<cr>",
		options = { desc = "Workspace Symbols (Trouble)" },
	},

	-- LSP definitions/references/etc.
	{
		mode = "n",
		key = "<leader>tl",
		action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		options = { desc = "LSP Definitions / References (Trouble)" },
	},

	-- Location list
	{
		mode = "n",
		key = "<leader>tl",
		action = "<cmd>Trouble loclist toggle<cr>",
		options = { desc = "Location List (Trouble)" },
	},

	-- Quickfix list
	{
		mode = "n",
		key = "<leader>tq",
		action = "<cmd>Trouble qflist toggle<cr>",
		options = { desc = "Quickfix List (Trouble)" },
	},

	-- ORIGINAL LSP KEYS (that don't have Trouble replacements)

	{
		mode = "n",
		key = "gd",
		action = "<cmd>lua vim.lsp.buf.definition()<CR>",
		options = { silent = true, desc = "Go to definition" },
	},
	{
		mode = "n",
		key = "gr",
		action = "<cmd>lua vim.lsp.buf.references()<CR>",
		options = { silent = true, desc = "Go to references" },
	},
	{
		mode = "n",
		key = "gD",
		action = "<cmd>lua vim.lsp.buf.declaration()<CR>",
		options = { silent = true, desc = "Go to declaration" },
	},
	{
		mode = "n",
		key = "gI",
		action = "<cmd>lua vim.lsp.buf.implementation()<CR>",
		options = { silent = true, desc = "Go to implementation" },
	},
	{
		mode = "n",
		key = "gT",
		action = "<cmd>lua vim.lsp.buf.type_definition()<CR>",
		options = { silent = true, desc = "Go to type definition" },
	},
	{
		mode = "n",
		key = "K",
		action = "<cmd>lua vim.lsp.buf.hover()<CR>",
		options = { silent = true, desc = "Hover documentation" },
	},
	{
		mode = "n",
		key = "<leader>cw",
		action = "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
		options = { silent = true, desc = "Workspace symbol" },
	},
	{
		mode = "n",
		key = "<leader>cr",
		action = "<cmd>lua vim.lsp.buf.rename()<CR>",
		options = { silent = true, desc = "Rename symbol" },
	},

	-- =====================================
	-- DIAGNOSTIC KEYMAPS
	-- =====================================
	{
		mode = "n",
		key = "<leader>cd",
		action = "<cmd>lua vim.diagnostic.open_float()<CR>",
		options = { silent = true, desc = "Line diagnostics" },
	},
	{
		mode = "n",
		key = "[d",
		action = "<cmd>lua vim.diagnostic.goto_next()<CR>",
		options = { silent = true, desc = "Next diagnostic" },
	},
	{
		mode = "n",
		key = "]d",
		action = "<cmd>lua vim.diagnostic.goto_prev()<CR>",
		options = { silent = true, desc = "Previous diagnostic" },
	},

	-- =====================================
	-- VISUAL MODE
	-- =====================================
	{
		mode = "v",
		key = "j",
		action = "v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj'",
		options = { expr = true, silent = true, desc = "Move down" },
	},
	{
		mode = "v",
		key = "k",
		action = "v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk'",
		options = { expr = true, silent = true, desc = "Move down" },
	},

	-- =====================================
	-- VISUAL BLOCK MODE (X MODE)
	-- =====================================
	{
		mode = "x",
		key = "j",
		action = "v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj'",
		options = { expr = true, silent = true, desc = "Move down" },
	},
	{
		mode = "x",
		key = "k",
		action = "v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk'",
		options = { expr = true, silent = true, desc = "Move down" },
	},

	-- =====================================
	-- TELESCOPE
	-- =====================================
	{
		mode = "n",
		key = "<leader>fa",
		action = "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
		options = { desc = "Telescope find all files" },
	},
	{
		mode = "n",
		key = "<leader>fw",
		action = "<cmd>Telescope live_grep<CR>",
		options = { desc = "Telescope live grep" },
	},
	{
		mode = "n",
		key = "<leader>fb",
		action = "<cmd>Telescope buffers<CR>",
		options = { desc = "Telescope find buffers" },
	},
	{
		mode = "n",
		key = "<leader>fh",
		action = "<cmd>Telescope help_tags<CR>",
		options = { desc = "Telescope help page" },
	},
	{
		mode = "n",
		key = "<leader>fm",
		action = "<cmd>Telescope marks<CR>",
		options = { desc = "Telescope find marks" },
	},
	{
		mode = "n",
		key = "<leader>fo",
		action = "<cmd>Telescope oldfiles<CR>",
		options = { desc = "Telescope find oldfiles" },
	},
	{
		mode = "n",
		key = "<leader>fz",
		action = "<cmd>Telescope current_buffer_fuzzy_find<CR>",
		options = { desc = "Telescope find in current buffer" },
	},
	{
		mode = "n",
		key = "<leader>fc",
		action = "<cmd>Telescope git_commits<CR>",
		options = { desc = "Telescope git commits" },
	},
	{
		mode = "n",
		key = "<leader>fg",
		action = "<cmd>Telescope git_status<CR>",
		options = { desc = "Telescope git status" },
	},
	{
		mode = "n",
		key = "<leader>ff",
		action = "<cmd>Telescope find_files<CR>",
		options = { desc = "Telescope find files" },
	},

	-- =====================================
	-- NEOTREE
	-- =====================================
	{
		mode = "n",
		key = "<leader>e",
		action = function()
			require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
		end,
		options = { silent = true, desc = "Toggle Neo-tree" },
	},

	-- =====================================
	-- WHICH-KEY
	-- =====================================
	{
		mode = "n",
		key = "<leader>?",
		action = function()
			require("which-key").show({ global = false })
		end,
		options = { desc = "Buffer Local Keymaps (which-key)" },
	},

	-- =====================================
	-- LAZYGIT
	-- =====================================
	{
		mode = "n",
		key = "<leader>lg",
		action = "<cmd>LazyGit<cr>",
		options = { desc = "Open LazyGit" },
	},

	-- =====================================
	-- TROUBLE
	-- =====================================
	{
		mode = "n",
		key = "<leader>tn",
		action = "<cmd>TodoTrouble toggle<cr>",
		options = { desc = "Notes (Trouble)" },
	},
	{
		mode = "n",
		key = "<leader>fn",
		action = "<cmd>TodoTelescope<CR>",
		options = { desc = "Telescope find all notes" },
	},
}

-- Apply all keymaps
for _, mapping in ipairs(keymaps) do
	vim.keymap.set(mapping.mode, mapping.key, mapping.action, mapping.options)
end

return keymaps
