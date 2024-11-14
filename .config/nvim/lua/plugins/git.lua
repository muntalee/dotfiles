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
		config = function()
			require("gitsigns").setup()
		end,
	},
}
