-- Replicate snacks.nvim rename module
local function on_rename_file(from, to)
	local changes = {
		files = { {
			oldUri = vim.uri_from_fname(from),
			newUri = vim.uri_from_fname(to),
		} },
	}

	local clients = vim.lsp.get_clients()
	for _, client in ipairs(clients) do
		if client:supports_method("workspace/willRenameFiles") then
			local resp = client:request_sync("workspace/willRenameFiles", changes, 1000, 0)
			if resp and resp.result ~= nil then
				vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding)
			end
		end
	end

	for _, client in ipairs(clients) do
		if client:supports_method("workspace/didRenameFiles") then
			client:notify("workspace/didRenameFiles", changes)
		end
	end
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-mini/mini.icons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	init = function()
		-- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
		-- because `cwd` is not set up properly.
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
			desc = "Start Neo-tree with directory",
			once = true,
			callback = function()
				if package.loaded["neo-tree"] then
					return
				else
					local stats = vim.uv.fs_stat(vim.fn.argv(0))
					if stats and stats.type == "directory" then
						require("neo-tree")
					end
				end
			end,
		})
	end,
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end,
			desc = "Toggle Neo-tree",
		},
	},
	opts = function(_, opts)
		local events = require("neo-tree.events")
		opts.event_handlers = opts.event_handlers or {}
		vim.list_extend(opts.event_handlers, {
			{
				event = events.FILE_MOVED,
				handler = function(data)
					on_rename_file(data.source, data.destination)
				end,
			},
			{
				event = events.FILE_RENAMED,
				handler = function(data)
					on_rename_file(data.source, data.destination)
				end,
			},
		})

		opts.filesystem = {
			follow_current_file = {
				enabled = true,
			},
			hijack_netrw_behavior = "open_current",
		}
		opts.window = {
			width = 30,
			mappings = {
				["<space>"] = "none", -- Ensure space key doesn't conflict with leader
			},
		}

		return opts
	end,
}
