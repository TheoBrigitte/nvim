return {
	{
		"milanglacier/minuet-ai.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			provider = "claude_parallel",
			context_window = 4000,
			debounce = 150,
			throttle = 0,
			provider_options = {
				claude = {
					model = "claude-haiku-4-5",
					api_key = "ANTHROPIC_API_KEY",
				},
				claude_parallel = {
					name = "claude",
				},
			},
		},
	},
}
