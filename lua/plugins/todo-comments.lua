return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufReadPost",
	opts = {},
	keys = {
		{ "<leader>tn", "<cmd>TodoTrouble toggle<cr>", desc = "Notes (Trouble)" },
		{ "<leader>fn", "<cmd>TodoFzfLua<CR>", desc = "Fzfl find all notes" },
	},
}
