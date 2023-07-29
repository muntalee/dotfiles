vim.cmd [[
  let s:guifontsize=20
  let s:guifont="JetBrainsMono\\ Nerd\\ Font"
  set guifont=JetBrainsMono\ Nerd\ Font:h20
  function! AdjustFontSize(amount)
  let s:guifontsize = s:guifontsize + a:amount
  execute "set guifont=" .. s:guifont .. ":h" .. s:guifontsize
  endfunction

  nnoremap <C-+> <cmd>call AdjustFontSize(+1)<cr>
  nnoremap <C--> <cmd>call AdjustFontSize(-1)<cr>
]]
