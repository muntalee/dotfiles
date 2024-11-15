return {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,

	config = function()
		-- Lua initialization file
		vim.cmd([[colorscheme moonfly]])

		-- transparency
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		-- require("catppuccin").setup({
		-- 	transparent_background = true,
		-- 	term_colors = true,
		-- })
	end,
}
