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
}
