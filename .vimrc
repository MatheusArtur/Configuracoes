" Vim for LaTeX and C programming
"
" Autor: Matheus Artur (macc@ic.ufal.br)
" C stuff adapted from: https://gist.github.com/rocarvaj/2513367 
" LaTex stuff from: https://github.com/LukeSmithxyz


" Load pathogen
    execute pathogen#infect()
    execute pathogen#helptags()

""" Basic
    filetype plugin on
    set relativenumber
    set number
    set enc=utf-8
    set fenc=utf-8
    set termencoding=utf-8
    set nocompatible

" some color
    colorscheme wal

" use indentation of previous line
    set autoindent

" use intelligent indentation for C
    set smartindent

" wrap lines at 80 chars
    set textwidth=80

" turn syntax highlighting on
    set t_Co=256
    syntax on

" highlight matching braces
    set showmatch

" configure tabwidth and insert spaces instead of tabs
    set tabstop=4      
    set shiftwidth=4  
    set expandtab    

" Shortcutting split navigation, saving a keypress:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
    set splitbelow
    set splitright

" Interpret .md files, etc. as .markdown
    let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Copy selected text to system clipboard (requires xclip installed):
    vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><enter>

" Open corresponding.pdf
    map <leader>p :!mupdf <c-r>%<backspace><backspace><backspace>pdf &<CR><CR>

""" Keyboard mappings

" Spell-check set to F1(English) and F2(Portuguese):
    map <F1> :setlocal spell! spelllang=en_us,es<CR>
    map <F2> :setlocal spell! spelllang=pt_br,es<CR>

" Get line, word and character counts with F3:
    map <F3> :!wc <C-R>%<CR>

" Compiles and run the code with F4:
    map <F4> :w <CR> :!clear && gcc % -o %< && ./%< <CR>

" Simple Stuff 
    nmap <F5> :w<CR>
    imap <F5> <ESC>:w<CR>i
    nmap <F6> :wq<CR>
    map <F7> :q!<CR>

 "____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
 "___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
              "|_|   |_|

"""LATEX
	" Word count:
	autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
	autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
	" Compile document using xelatex:
	autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
	autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
	" Code snippets
	autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ;li <Enter>\item<Space>
	autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ;bt {\blindtext}
	autocmd FileType tex inoremap ;nu $\varnothing$
	autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i

"""LATEX Logical symbols
	autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
	autocmd FileType tex inoremap ;M $$$$<Enter><Enter><++><Esc>2k$hi
	autocmd FileType tex inoremap ;neg {\neg}
	autocmd FileType tex inoremap ;V {\vee}
	autocmd FileType tex inoremap ;or {\vee}
	autocmd FileType tex inoremap ;L {\wedge}
	autocmd FileType tex inoremap ;and {\wedge}
	autocmd FileType tex inoremap ;ra {\rightarrow}
	autocmd FileType tex inoremap ;la {\leftarrow}
	autocmd FileType tex inoremap ;lra {\leftrightarrow}
	autocmd FileType tex inoremap ;fa {\forall}
	autocmd FileType tex inoremap ;ex {\exists}
	autocmd FileType tex inoremap ;dia	{\Diamond}
	autocmd FileType tex inoremap ;box	{\Box}
	autocmd FileType tex inoremap ;gt	{\textgreater}
	autocmd FileType tex inoremap ;lt	{\textless}

"MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
	autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>--pdf-engine=xelatex<space>-o<space><C-r>%.pdf<Enter><Enter>
	autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
	autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO

" ------------------------------------- TESTING ZONE ------------------------------------- "
"
"
"
"
" --- EOF --- "
