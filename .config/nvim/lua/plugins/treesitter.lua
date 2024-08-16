return {
	{
		"nvim-treesitter/nvim-treesitter",
		priority = 999,
		tag = "v0.9.1",
		opts = {
			ensure_installed = {
				"javascript",
				"typescript",
				"css",
				"java",
				"c",
				"cpp",
				"makefile",
				"gitignore",
				"http",
				"json",
				"scss",
				"sql",
				"vim",
				"lua",
				"rust",
			},
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
		},
	},
}
