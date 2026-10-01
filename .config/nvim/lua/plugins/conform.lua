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
            c = { "clang-format" },
            cpp = { "clang-format" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            json = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
        },

        formatters = {
            ["clang-format"] = {
                args = { "-assume-filename", "$FILENAME", "--style={BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never}" },
            },
        },
    },
}

