return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
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
			"<leader>dr",
			function()
				require("dap.repl").open()
			end,
			desc = "DAP: Inspect REPL",
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
		{
			"<leader>duu",
			function()
				require("dapui").open()
			end,
			desc = "DAP: Open UI",
		},
		{
			"<leader>duc",
			function()
				require("dapui").close()
			end,
			desc = "DAP: Close UI",
		},
		{
			"<leader>dut",
			function()
				require("dapui").toggle()
			end,
			desc = "DAP: Toggle UI",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		-- Python setup (assumes debugpy is installed via Mason)
		local python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
		require("dap-python").setup(python_path)

		-- UI Auto-open/close
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
