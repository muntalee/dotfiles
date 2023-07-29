vim.cmd [[
let g:lightline = {
  \ 'colorscheme': 'base16',
  \ }
]]

vim.cmd.colorscheme('base16-default-dark')

-- if not vim.g.neovide then
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end

vim.o.termguicolors = true
vim.o.laststatus = 2
vim.o.showmode = false
