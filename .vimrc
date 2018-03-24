" Vim Otimizado para C.
" Autor: Matheus Artur
"
" Carregar o pathogen (Para plugins, etc.) 
execute pathogen#infect()
execute pathogen#helptags()

" Basico
filetype plugin on
set relativenumber
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" Enhanced keyboard mappings
nmap <F1> :w<CR>
imap <F1> <ESC>:w<CR>i
nmap <F2> :wq<CR>
imap <F2> <ESC>:wq<CR>i
map <F3> :w <CR> :!clear && gcc % -o %< && ./%< <CR>
map <F4> :w <CR> :!clear && gcc % <CR>
map <F5> :w<CR>

autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
