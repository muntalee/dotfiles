return {
    "cpplain/flexoki.nvim",
    lazy = false,
    priority = 1000,
    opts = {},

    config = function()
        vim.cmd([[colorscheme flexoki]])
        vim.o.background = "dark"

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}
