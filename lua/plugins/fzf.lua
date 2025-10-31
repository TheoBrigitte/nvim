return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "nvim-mini/mini.icons" },
		opts = {},
		keys = {
			{ "<leader>f", function() FzfLua.files() end, mode = "n", desc = "Fzf files" },
			{ "<leader>b", function() FzfLua.buffers() end, mode = "n", desc = "Fzf buffers" },
			{ "<leader>gr", function() FzfLua.grep() end, mode = "n", desc = "Fzf grep" },
		},
	}
}
