vim.cmd([[filetype plugin on]])

local opt = vim.opt

opt.compatible = false

-- tabs & indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
vim.cmd([[set colorcolumn=80]])

opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- appearance
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "number"

-- clipboard & backspace
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")

-- splits
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")

-- undo dir
opt.undodir = "/tmp/"
opt.undofile = true

-- fully hide statusline
vim.opt.laststatus = 0
vim.opt.showmode = false
vim.api.nvim_set_hl(0, "Statusline", { link = "Normal" })
vim.api.nvim_set_hl(0, "StatuslineNC", { link = "Normal" })

-- hide ~ in blank lines
vim.opt.fillchars = { eob = " " }
vim.cmd([[hi NonText guifg=bg]])

-- theming that i want for all colorschemes
vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhitespace /\s\+$/]])
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
vim.cmd([[highlight LineNr guibg=NONE cterm=NONE]])
