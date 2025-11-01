return {
	-- Mason: package manager for LSP servers, formatters, linters, etc.
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},

	-- Mason LSP Config: bridges mason.nvim with nvim-lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			-- Only LSP servers here
			ensure_installed = {
				"gopls",
				"copilot",
			},
		},
	},

	-- Mason Tool Installer: auto-install formatters, linters, and other tools
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			-- Non-LSP tools: formatters, linters, DAP servers, etc.
			ensure_installed = {
				"gofumpt",           -- Go formatter (stricter than gofmt)
				"goimports-reviser", -- Go imports formatter
				"shellcheck",        -- Shell script linter
			},
			auto_update = false,
			run_on_start = true,
		},
	},
}
