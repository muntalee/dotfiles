syntax on
let mapleader = " "
filetype off

" editing
set ts=4 sts=4 sw=4
set expandtab
set smarttab
set clipboard=unnamed
set backspace=indent,eol,start
set ignorecase
set smartcase

" visual
set nu
set nohlsearch
set incsearch
set cursorline
set nowrap
set noerrorbells
set colorcolumn=90
set complete-=i
set lazyredraw
set cot+=preview
set laststatus=2
set splitbelow
set scrolloff=2
set signcolumn=number
set ruler
set mouse+=a

" history
set backup
set swapfile
set undofile
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo

" for warp text
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" buffer control
nmap <silent> <leader>e :enew<CR>
nmap <silent> <leader>w :bw<CR>
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" enable/disable line numbers
nmap <C-n> :set nu!<CR>

" compiling c++ code
autocmd FileType cpp nnoremap <C-b> :w<CR>:!g++ -Wall -std=c++17 -O2 % -o %<.out && ./%<.out<CR>
" running python files
autocmd FileType python nnoremap <C-b> :w<CR>:!python3 %<CR>

" ooen in file system (macos)
nmap <silent> <leader>fo :!open .<CR>

" font
set guioptions=
set guifont=UbuntuMono\ Nerd\ Font:h18

" coloring
colorscheme wildcharm
hi Normal guibg=NONE ctermbg=NONE
set termguicolors

" highlights extra space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

