return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            width = 85,
            options = {
                number = false,
                relativenumber = false,
                signcolumn = "no",
                cursorline = false,
                colorcolumn = "",
            },
        },

        on_close = function()
            vim.cmd("quit")
        end,
    },
}
