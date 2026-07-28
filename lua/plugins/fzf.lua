return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "nvim-mini/mini.icons" },
		opts = {
			grep = {
				actions = {
					-- Default action when an item/selection is accepted
					["default"] = {
						fn = function(...) FzfLua.actions.file_sel_to_qf(...) end,
						prefix = "select-all",
					},
				},
			},
			fzf_opts = {
				['--layout'] = 'reverse',
			},
			winopts = {
				preview = {
					horizontal = "up:80%",
				}
			}
		},
		keys = {
			{ "<leader>f", function() FzfLua.files() end, mode = "n", desc = "Search and open file" },
			{ "<leader>b", function() FzfLua.buffers() end, mode = "n", desc = "Switch buffer" },
			{ "<leader>gr", function() FzfLua.live_grep() end, mode = "n", desc = "Grep it" },
			{ "<leader>r", function() FzfLua.registers() end, mode = "n", desc = "Paste from registers" },
			{ "<leader>l", function() FzfLua.blines() end, mode = "n", desc = "Search through current buffer lines" },
			{ "<leader>ma", function() FzfLua.marks() end, mode = "n", desc = "Jump through marks" },
			{ "<leader>j", function() FzfLua.jumps() end, mode = "n", desc = "Jump through jumps" },
		},
	}
}
