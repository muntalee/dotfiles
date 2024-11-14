return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,

	config = function()
		-- transparency
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		require("catppuccin").setup({
			transparent_background = true,
			term_colors = true,
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
