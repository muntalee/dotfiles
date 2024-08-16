return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	keys = {
		-- Find files within the current working directory, respects .gitignore
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Find Files",
			silent = true,
			remap = true,
		},

		-- List recently opened files
		{
			"<leader>fr",
			":Telescope oldfiles<CR>",
			desc = "Recent Files",
			silent = true,
			remap = true,
		},

		-- Find a string in the current working directory as you type
		{
			"<leader>fs",
			"<cmd>Telescope live_grep<cr>",
			desc = "Find String (Live Grep)",
			silent = true,
			remap = true,
		},

		-- Find the string under the cursor in the current working directory
		{
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			desc = "Find String Under Cursor",
			silent = true,
			remap = true,
		},

		-- List available help tags
		{
			"<leader>fh",
			"<cmd>Telescope help_tags<cr>",
			desc = "Help Tags",
			silent = true,
			remap = true,
		},
	},
}
