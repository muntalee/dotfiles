return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,

	config = function()
		-- transparency
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		require("onedark").setup({
			transparent = true,
		})

		vim.cmd("colorscheme onedark")
	end,
}
