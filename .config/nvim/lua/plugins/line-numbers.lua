return {
	"mluders/comfy-line-numbers.nvim",
	config = function()
		require("comfy-line-numbers").setup()

		local numbers_hidden = false

		local function update_line_numbers()
			if numbers_hidden then
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					vim.api.nvim_set_option_value("number", false, { win = win })
					vim.api.nvim_set_option_value("relativenumber", false, { win = win })
					vim.api.nvim_set_option_value("statuscolumn", "", { win = win })
				end
			else
				_G.update_status_column()
			end
		end

		vim.keymap.set("n", "<C-n>", function()
			numbers_hidden = not numbers_hidden
			if not numbers_hidden then
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					vim.api.nvim_set_option_value("number", true, { win = win })
					vim.api.nvim_set_option_value("relativenumber", true, { win = win })
				end
			end
			update_line_numbers()
		end, { desc = "Toggle all line numbers" })

		vim.api.nvim_create_autocmd({
			"WinNew",
			"BufWinEnter",
			"BufEnter",
			"TermOpen",
			"InsertEnter",
			"InsertLeave",
			"FileType",
		}, {
			group = vim.api.nvim_create_augroup("ComfyLineNumberVisibility", { clear = true }),
			callback = update_line_numbers,
		})
	end,
}
