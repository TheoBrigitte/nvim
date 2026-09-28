return {
	{
		"milanglacier/minuet-ai.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			provider = "claude",
			provider_options = {
				claude = {
					model = "claude-haiku-4-5",
					api_key = "ANTHROPIC_API_KEY",
				},
			},
		},
	},
}
