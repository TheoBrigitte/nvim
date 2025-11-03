return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		keys = {
			{ "<leader>n", "<cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
			{ "<leader>m", "<cmd>Neotree reveal<CR>", desc = "Reveal file in NeoTree" },
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			enable_git_status = false,
		}
	}
}
