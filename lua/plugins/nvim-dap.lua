return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"igorlfs/nvim-dap-view",
			"mfussenegger/nvim-dap-python",
		},
		keys = {
			{
				"<leader>dt",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "DAP: Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "DAP: Continue",
			},
			{
				"<leader>dk",
				function()
					require("dap").terminate()
				end,
				desc = "DAP: Terminate",
			},
			{
				"<leader>dso",
				function()
					require("dap").step_over()
				end,
				desc = "DAP: Step Over",
			},
			{
				"<leader>dsi",
				function()
					require("dap").step_into()
				end,
				desc = "DAP: Step Into",
			},
			{
				"<leader>dsu",
				function()
					require("dap").step_out()
				end,
				desc = "DAP: Step Out",
			},
			{
				"<leader>dl",
				function()
					require("dap").run_last()
				end,
				desc = "DAP: Run Last",
			},
		},
		config = function()
			-- Python setup (assumes debugpy is installed via Mason)
			local python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(python_path)
		end,
	},

	{
		"igorlfs/nvim-dap-view",
		opts = {
			winbar = {
				controls = { enabled = true },
			},
		},
		keys = {
			{
				"<leader>duu",
				function()
					require("dap-view").toggle()
				end,
				desc = "DAP: Toggle View",
			},
			{
				"<leader>duv",
				function()
					require("dap-view").virtual_text_toggle()
				end,
				desc = "DAP: Toggle Virtual Text",
			},
		},
	},
}
