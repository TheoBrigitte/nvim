return {
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
}
