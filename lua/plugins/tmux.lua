return {
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "`<Left>", "<cmd>TmuxNavigateLeft<cr>" },
			{ "`<Down>", "<cmd>TmuxNavigateDown<cr>" },
			{ "`<Up>", "<cmd>TmuxNavigateUp<cr>" },
			{ "`<Right>", "<cmd>TmuxNavigateRight<cr>" },
			{ "`<Tab>", "<cmd>TmuxNavigatePrevious<cr>" },
		},
		config = function()
			-- Disable tmux navigator when zooming the Vim pane
			vim.g.tmux_navigator_disable_when_zoomed = 1
		end,
	}
}
