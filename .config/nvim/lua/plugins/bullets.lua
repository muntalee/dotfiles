return {
	"bullets-vim/bullets.vim",
	config = function()
		vim.g.bullets_enabled_file_types = {
			"markdown",
			"text",
			"gitcommit",
			"scratch",
		}

		vim.g.bullets_enable_in_empty_buffers = 1

		vim.g.bullets_custom_mappings = {
			{ "imap", "<cr>", "<Plug>(bullets-newline)" },
			{ "nmap", "o", "<Plug>(bullets-newline)" },
			{ "vmap", "gN", "<Plug>(bullets-renumber)" },
			{ "nmap", "gN", "<Plug>(bullets-renumber)" },
			{ "nmap", "<leader>x", "<Plug>(bullets-toggle-checkbox)" },
			{ "imap", "<Tab>", "<Plug>(bullets-demote)" },
			{ "nmap", ">>", "<Plug>(bullets-demote)" },
			{ "vmap", ">", "<Plug>(bullets-demote)" },
			{ "imap", "<S-Tab>", "<Plug>(bullets-promote)" },
			{ "nmap", "<<", "<Plug>(bullets-promote)" },
			{ "vmap", "<", "<Plug>(bullets-promote)" },
		}

		-- for line breaks
		vim.cmd([[
            autocmd FileType markdown setlocal textwidth=80
            autocmd FileType markdown setlocal breakindent
            autocmd FileType markdown setlocal linebreak
        ]])
	end,
}
