return {
	"folke/noice.nvim",
	event = "VimEnter",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local status_ok, noice = pcall(require, "noice")

		if not status_ok then
			return
		end

		noice.setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				signature = {
					enabled = false,
				},
				hover = {
					enabled = false,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
				bottom_search = false,
				command_palette = false,
			},
			messages = {
				enabled = false,
			},
			-- popupmenu = {
			--     enabled = false
			-- }
		})
	end,
}
