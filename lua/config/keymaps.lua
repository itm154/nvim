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
		options = { silent = true, desc = "Beginning of Line" },
	},
	{
		mode = "i",
		key = "<C-e>",
		action = "<End>",
		options = { silent = true, desc = "End of Line" },
	},
	{
		mode = "i",
		key = "<C-h>",
		action = "<Left>",
		options = { silent = true, desc = "Move Left" },
	},
	{
		mode = "i",
		key = "<C-l>",
		action = "<Right>",
		options = { silent = true, desc = "Move Right" },
	},
	{
		mode = "i",
		key = "<C-j>",
		action = "<Down>",
		options = { silent = true, desc = "Move Down" },
	},
	{
		mode = "i",
		key = "<C-k>",
		action = "<Up>",
		options = { silent = true, desc = "Move Up" },
	},

	-- =====================================
	-- NORMAL MODE
	-- =====================================
	{
		mode = "n",
		key = "j",
		action = "v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj'",
		options = { expr = true, silent = true, desc = "Move Down" },
	},
	{
		mode = "n",
		key = "k",
		action = "v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk'",
		options = { expr = true, silent = true, desc = "Move Up" },
	},
	-- Window navigation
	{
		mode = "n",
		key = "<C-h>",
		action = "<C-w>h",
		options = { silent = true, desc = "Window Left" },
	},
	{
		mode = "n",
		key = "<C-l>",
		action = "<C-w>l",
		options = { silent = true, desc = "Window Right" },
	},
	{
		mode = "n",
		key = "<C-j>",
		action = "<C-w>j",
		options = { silent = true, desc = "Window Down" },
	},
	{
		mode = "n",
		key = "<C-k>",
		action = "<C-w>k",
		options = { silent = true, desc = "Window Up" },
	},
	-- Utility
	{
		mode = "n",
		key = "<Esc>",
		action = "<cmd>noh<CR>",
		options = { silent = true, desc = "Clear Highlights" },
	},
	{
		mode = "n",
		key = "<C-s>",
		action = "<cmd>w<CR>",
		options = { silent = false, desc = "Save File" },
	},
	{
		mode = "n",
		key = "<C-c>",
		action = "<cmd>%y+<CR>",
		options = { silent = false, desc = "Copy Whole File" },
	},
	{
		mode = "n",
		key = "<leader>n",
		action = "<cmd>set rnu!<CR>",
		options = { silent = true, desc = "Toggle Relative Numbers" },
	},
	{
		mode = "n",
		key = "<leader>x",
		action = "<cmd>bd<CR>",
		options = { silent = true, desc = "Close Buffer" },
	},

	-- =====================================
	-- VISUAL MODE
	-- =====================================
	{
		mode = "v",
		key = "j",
		action = "v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj'",
		options = { expr = true, silent = true, desc = "Move Down" },
	},
	{
		mode = "v",
		key = "k",
		action = "v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk'",
		options = { expr = true, silent = true, desc = "Move Up" },
	},

	-- =====================================
	-- VISUAL BLOCK MODE (X MODE)
	-- =====================================
	{
		mode = "x",
		key = "j",
		action = "v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj'",
		options = { expr = true, silent = true, desc = "Move Down" },
	},
	{
		mode = "x",
		key = "k",
		action = "v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk'",
		options = { expr = true, silent = true, desc = "Move Up" },
	},
}

-- Apply all keymaps
for _, mapping in ipairs(keymaps) do
	vim.keymap.set(mapping.mode, mapping.key, mapping.action, mapping.options)
end

return keymaps
