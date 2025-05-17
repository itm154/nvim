-- Set clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable cursorline but only highlight the line number
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Tab and indent settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Remove end-of-buffer tilde characters
vim.opt.fillchars = { eob = " " }

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable mouse in all modes
vim.opt.mouse = "a"

-- Line number settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- Disable ruler
vim.opt.ruler = false

-- Show sign column
vim.opt.signcolumn = "yes"

-- Split windows to the right and below
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable persistent undo
vim.opt.undofile = true

-- Keep cursor 4 lines from screen edge when scrolling
vim.opt.scrolloff = 4
