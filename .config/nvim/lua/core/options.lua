vim.cmd([[filetype plugin on]])

local opt = vim.opt

opt.compatible = false

-- tabs & indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- appearance
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.showmode = false

opt.updatetime = 1000

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.INFO] = "I",
            [vim.diagnostic.severity.HINT] = "H",
        },
    },
})

-- clipboard & backspace
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")

-- splits
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")

-- reload files changed on disk (e.g. by external tools like opencode)
opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
    pattern = "*",
    callback = function()
        vim.cmd("checktime")
    end,
})

-- undo dir
opt.undodir = "/tmp/"
opt.undofile = true
