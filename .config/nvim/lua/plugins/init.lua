-- a collection of basic plugins that dont require its own file
return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"aserowy/tmux.nvim",
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"xiyaowong/virtcolumn.nvim",
		config = function()
			vim.g.virtcolumn_char = "▕" -- char to display the line
			vim.g.virtcolumn_priority = 10 -- priority of extmark
		end,
	},
	{
		"sitiom/nvim-numbertoggle",
	},
}
