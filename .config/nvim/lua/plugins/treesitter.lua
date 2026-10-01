return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup()

            require("nvim-treesitter").install({
                "lua",
                "python",
                "c",
                "cpp",
                "rust",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "json",
                "bash",
                "markdown",
                "vim",
                "vimdoc",
            })

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}
