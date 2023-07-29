vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.c",
    command = [[0r ~/.vim/templates/skeleton.c]]
})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.java", command = [[0r ~/.vim/templates/skeleton.java]]
})
