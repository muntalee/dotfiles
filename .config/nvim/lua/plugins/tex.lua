vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.tex_flavor = "latex"

return {
  {
    "lervag/vimtex",
    lazy = false,
    ft = { "tex", "bib" },
  },
}