return {
	{
		"nvim-treesitter/nvim-treesitter",
		priority = 999,
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
			auto_install = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
			additional_vim_regex_highlighting = false,
		},
	},
}
