--[[
return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			mode = "buffers",
			show_close_icon = false,
			show_buffer_close_icons = false,
			separator_style = "",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level)
				return level == "error" and " E" or " W"
			end,
		},
		highlights = {
			fill = { bg = "none" },
			background = { bg = "none" },
			buffer_visible = { bg = "none" },
			buffer_selected = { bg = "none", bold = true },
			separator = { bg = "none", fg = "none" },
			separator_selected = { bg = "none", fg = "none" },
			separator_visible = { bg = "none", fg = "none" },
			tab = { bg = "none" },
			tab_selected = { bg = "none", bold = true },
		},
	},
}
]]

return {}
