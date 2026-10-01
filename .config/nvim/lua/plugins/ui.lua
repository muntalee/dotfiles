return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"StatusLine",
					"StatusLineNC",
					"TabLine",
					"TabLineFill",
					"TabLineSel",
				},
			})
			vim.cmd.TransparentEnable()
		end,
	},
}