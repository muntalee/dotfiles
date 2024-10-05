return {

	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 1000,

	config = function()
		-- transparency
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		require("github-theme").setup({
			options = {
				transparent = true,
			},
		})

		vim.cmd("colorscheme github_dark_dimmed")
	end,
}
