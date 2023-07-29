vim.g.mapleader = " "

-- tab control

vim.keymap.set("n", "te", ":tabe<CR>")
vim.keymap.set("n", "tn", ":tabn<CR>")
vim.keymap.set("n", "tp", ":tabp<CR>")
vim.keymap.set("n", "tw", ":tabc<CR>")
vim.keymap.set("n", "<Tab>", ":tabn<CR>")
vim.keymap.set("n", "<S-Tab>", ":tabp<CR>")

-- split control

vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<c-q>", ":q<CR>")

-- terminal

vim.keymap.set("n", "<c-p>", ":FloatermToggle<CR>")

-- Tab to indent in visual mode

vim.keymap.set("v", "<Tab>", ">")
vim.keymap.set("v", "<S-Tab>", "<")

-- file explorer 

vim.keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", ":NvimTreeFind<CR>")

-- telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- prettier

vim.keymap.set("n", "<leader>s", ":Neoformat<CR>")
