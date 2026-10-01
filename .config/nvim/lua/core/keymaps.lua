local keymap = vim.keymap

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>\\", "<C-w>v")                             -- split window vertically
keymap.set("n", "<leader>-", "<C-w>s")                              -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")                             -- make split windows equal width & height

keymap.set("n", "<leader>n", ":enew<CR>", { silent = true })        -- open new buffer
keymap.set("n", "<leader>b", ":ls<CR>:b<Space>", { silent = true }) -- list buffers
keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })           -- go to next buffer
keymap.set("n", "<S-Tab>", ":bprev<CR>", { silent = true })         -- go to previous buffer
keymap.set("n", "<leader>w", ":bd<CR>", { silent = true })          -- close current split window

-- mapping to restart lsp if necessary
keymap.set("n", "<leader>rs", ":LspRestart<CR>", { noremap = true, silent = true })

-- enable/disable line numbers
keymap.set("n", "<C-n>", ":set nu! rnu!<cr>")

-- opens file explorer
keymap.set("n", "<leader>fo", ":!open .<cr>")

-- deleting a word with ctrl-backspace, just because of muscle memory
keymap.set("i", "<C-BS>", "<C-w>")
keymap.set("c", "<C-BS>", "<C-w>")
