return {
    {
        name = "journal",
        dir = vim.fn.stdpath("config"),
        lazy = false,

        config = function()
            local journal_dir = vim.fn.expand("~/notes/journal")

            vim.fn.mkdir(journal_dir, "p")

            vim.keymap.set("n", "<leader>jd", function()
                local filename = os.date("%d-%b-%Y") .. ".md"
                local filepath = vim.fs.joinpath(journal_dir, filename)

                vim.cmd.edit(vim.fn.fnameescape(filepath))

                -- Create today's journal entry if it's a new file
                if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
                    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
                        "# Journal",
                        "",
                        os.date("%d-%b-%Y"),
                        "-----",
                        "",
                    })
                end

                -- Go to the bottom and start writing
                vim.cmd("normal! G")

                -- Enter Zen Mode
                vim.cmd("ZenMode")
            end, {
                desc = "Today's journal",
            })
        end,
    },
}
