set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc() 
Bundle 'gmarik/vundle'
Bundle 'surround.vim'
Bundle 'Align'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'dilawar/c.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/DrawIt'
"Bundle 'vim-scripts/ShowMarks'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'vim-scripts/check-mutt-attachments.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ervandew/supertab'
Bundle 'kana/vim-fakeclip'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "hdima/python-syntax"
"Bundle 'dilawar/vimlatex'
Bundle "vimwiki/vimwiki"
Bundle "danchoi/elinks.vim"
Bundle "tshirtman/vim-cython"

filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd    " Show (partial) command in status line.
set showmatch  " Show matching brackets.
set smartcase  " Do smart case matching
set incsearch  " Incremental search
set mouse=a    " Enable mouse usage (all modes)
set number
set ruler
set hlsearch
set autoindent
set smartindent
set nospell
set encoding=utf-8
"set spell spelllang=en
"" This option crashed vim in gentoo
" set dictionary+=/usr/share/dict/words
" no dictionary autocomplete. 
set complete-=k

syntax enable

" c-support
set makeprg=make
if filereadable("build_me.sh")
    set makeprg=./build_me.sh
endif
set wildmode=longest,list


" Mappings
source $HOME/.vim/mymappings.vim

" Supertab
let g:SuperTabDefaultCompletionType = "context"

"" Section for literate programming.
au BufNewFile *.nw read ~/Scripts/template.snw 
au BufRead,BufNewFile *.nw set filetype=noweb
au BufRead,BufNewFile *.w set filetype=noweb
au BufRead,BufNewFile *.nw set spell spelllang=en
au BufRead,BufNewFile *.blog set filetype=markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.markdown set filetype=markdown

" Make pandoc behave like tex
au BufRead,BufNewFile *.pandoc setlocal filetype=tex |
    \ setlocal makeprg=markdown_to_pdf.sh\ % |
    \ setlocal spell spelllang=en

let noweb_backend="tex"
let noweb_language="python"
let noweb_fold_code=1

au BufRead,BufNewFile *.tex set spell spelllang=en
au BufEnter *.tex set nosmartindent

" Blog related setting.
au BufRead,BufNew *.blog setlocal spell spelllang=en 
au BufRead,BufNew *.blog setlocal filetype=html
au BufRead,BufNew *.blog setlocal complete+=k
au BufRead,BufNew *.md setlocal complete+=k
au BufRead,BufNew *.md setlocal spell spelllang=en
au BufRead,BufNew *.markdown setlocal complete+=k
au BufRead,BufNew *.markdown setlocal syntax=markdown
au BufRead,BufNew *.markdown setlocal spell spelllang=en


au BufNewFile *.vhd read ~/.vim/template/template.vhd
" au BufRead,BufNewFile *.bsv set filetype=verilog
au BufRead,BufNewFile *.bsv set syntax=bsv


" vim-latexsuite mapping
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule = 'yap -1'

set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!
" unicode \u2506
"let g:haddock_browser="/usr/bin/elinks"
let g:haddock_docdir= "/usr/share/doc/ghc/html/"


" colorscheme and all
set bg=dark
"colorscheme solarized
colorscheme torte
set cc=+1
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" c-support

set errorformat+=%f:%l:\ %m
set errorformat^=%-G%f:%l:\ warning:%m

source $HOME/.vim/methods.vim 

"" SnipMate 
let g:snips_author = 'Dilawar Singh'
let g:snips_email = 'dilawars@ncbs.res.in'


" Python related settings
autocmd BufRead *.py setlocal makeprg=pylint\ -E\ %:p
let g:pymode_lint_write=0
let g:pymode_lint=0

"indent guide
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
let g:vundle_default_git_proto = 'git'

" default
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set textwidth=80
set wrap
set iskeyword+=_
"set foldmethod=manual
set autoread
set showmatch
set backspace=2 "
"set oldmethod=syntax
set foldnestmax=2
