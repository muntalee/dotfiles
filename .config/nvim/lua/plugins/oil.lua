return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	keys = {
		{ "-", "<CMD>Oil<CR>", silent = true },
	},
	opts = {
		default_file_explorer = true,
	},
}
