return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { { "prettierd", "prettier", "eslint_d" } },
            javascriptreact = { { "prettierd", "prettier", "eslint_d" } },
            c = { "astyle_allman" },
            cpp = { "astyle_allman" },
            json = { "fixjson" },
        },
        formatters = {
            astyle_allman = {
                command = "astyle",
                args = { "--style=allman", "--indent=spaces=4" },
            },
        },
    },
}
