" Vim Otimizado para C.
" Autor: Matheus Artur

" Carregar o pathogen (Para plugins, etc.) 
execute pathogen#infect()
execute pathogen#helptags()
" Basico
set nocp
filetype plugin on
set relativenumber
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
" Identifica linhas 
set autoindent
" Identifica linguagem
set smartindent
" Tab para 4 espacos
set tabstop=4        
set shiftwidth=4    
set expandtab      
" Caracteres por linha 
set textwidth=120
" Sintaxe colorida 
set t_Co=256
syntax on
" Ativar o numero de linhas (na lateral) 
set number
" Dar match em parenteses, cochetes, etc.. 
set showmatch
" Mapeamento avançado
nmap <F1> :w<CR> 
imap <F1> <ESC>:w<CR>i
nmap <F2> :wq<CR>
imap <F2> <ESC>:wq<CR>i
map <F3> :w <CR> :!clear && gcc % -lm -o %< && ./%< <CR>
map <F4> :w <CR> :!clear && gcc % <CR>
