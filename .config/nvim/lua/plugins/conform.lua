return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			c = { "astyle_allman" },
			cpp = { "astyle_allman" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			json = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			formatters = {
				astyle_allman = {
					command = "astyle",
					args = { "--style=allman", "--indent=spaces=4" },
				},
			},
		},
	},
}
