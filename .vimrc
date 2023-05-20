execute pathogen#infect()
syntax on
filetype plugin indent on

" general config
set ts=4 sts=4 sw=4
set expandtab
set background=dark
set nobackup
set nu
set smarttab
set noswapfile
set nohlsearch
set incsearch
set mouse=a
set clipboard=unnamed
set cursorline
set backspace=indent,eol,start
set noerrorbells
set complete-=i
set lazyredraw
set statusline=2
set noshowmode

" keymaps

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

nmap te :tabe<CR>
nmap tn :tabn<CR>
nmap tp :tabp<CR>
nmap tw :tabc<CR>

nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" plugin configs
let g:pymode_python = 'python3'
let g:python_highlight_all = 1
let g:livepreview_previewer = 'zathura'
let g:polyglot_initialized = ['markdown', 'json', 'rust', 'cpp-modern', 'c/c++']
let g:airline#extensions#tabline#formatter = 'unique_tail'

if has("gui_running")
    let g:airline_theme='base16'
endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd'.argv()[0] | endif
