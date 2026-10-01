return {
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{
				"<leader>gg",
				":LazyGit<Return>",
				silent = true,
				noremap = true,
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = { add = { text = "" }, change = { text = "" }, delete = { text = "" }, topdelete = { text = "" }, changedelete = { text = "" } },
			signcolumn = false,
			preview_config = { show_header = false },
			numhl = false,
			linehl = false,
		},
	},
}
