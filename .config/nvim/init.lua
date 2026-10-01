vim.g.mapleader = " "

-- lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}

-- Import your normal plugins
for _, file in ipairs(vim.fn.glob(
    vim.fn.stdpath("config") .. "/lua/plugins/*.lua",
    true,
    true
)) do
    local specs = dofile(file)
    vim.list_extend(plugins, specs)
end

require("lazy").setup({ import = "plugins" }, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})

-- essentials
require("core.keymaps")
require("core.options")
