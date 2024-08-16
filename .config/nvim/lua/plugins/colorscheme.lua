return {

	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,

	config = function()
		-- transparency
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		vim.g.moonflyTransparent = true
		vim.cmd.colorscheme("moonfly")
	end,
}
