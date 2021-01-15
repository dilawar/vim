" Prefer python3
set pyx=3

call plug#begin("~/.vim/plugged")

Plug 'gmarik/vundle'

"" LucHermite
Plug 'tomtom/stakeholders_vim'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/alternate-lite'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/DrawIt'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-pandoc/vim-pandoc'

" Tabular
Plug 'godlygeek/tabular'

" FIXME: See https://stackoverflow.com/questions/13621845/vim-pumvisible-call-putting-in-random-text
" Plug 'rstacruz/vim-closer'
" let g:AutoClosePreserveDotTeg = 0

set nopaste    
Plug 'posva/vim-vue'
Plug 'vim-scripts/check-mutt-attachments.vim'
Plug 'itchyny/calendar.vim'
Plug 'godlygeek/tabular'
Plug 'coyotebush/vim-pweave'
Plug 'rhysd/vim-clang-format'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
let g:pydocstring_doq_path = expand("$HOME/.local/bin/doq")
let g:pydocstring_formatter = "numpy"

" tags
Plug 'craigemery/vim-autotag'

" php
Plug 'phpstan/vim-phpstan'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'dilawar/better-indent-support-for-php-with-html'

" Python 
" jedi does not work well when different version of python are installed. Never
" figured out what is the issue and life feels short to have such a fun!
" Plug 'davidhalter/jedi-vim'

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'dilawar/vim-mypy'


" Snippets
Plug 'SirVer/ultisnips'
Plug 'dilawar/vim-snippets'
let g:snips_author = "Dilawar Singh"
let g:snips_email = "dilawar@subcom.tech"

" clang-format'
Plug 'rhysd/vim-clang-format'
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++17",
            \ "BreakBeforeBraces" : "Stroustrup"}

Plug 'chrisbra/unicode.vim'
" Turn TeX symbols into unicode.
Plug 'dilawar/vim-unicoder'
Plug 'bling/vim-airline'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'lervag/vimtex'

Plug 'flazz/vim-colorschemes'

Plug 'preservim/nerdcommenter'

Plug 'alvan/vim-closetag'
 

call plug#end()



au BufRead,BufNewFile *.plantuml set filetype=plantuml

let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_cpp_gcc_options = '-std=c++17'
let g:ale_tex_chktex_options = '-n26 -n18'
let g:ale_linters = {
            \ 'python' : [ 'pyflakes'], 
            \ 'php' : [ 'php-cs-fixer', 'psalm', 'php'], 
            \}
let g:ale_php_phpcs_executable='./vendor/bin/phpcs'
let g:ale_php_php_cs_fixer_executable='./vendor/bin/php-cs-fixer'

" vimtex
let g:tex_flavor="latex"

" colorscheme
" set background=dark
" colorscheme material


" vim alternate
let g:alternateSearchPath="sfr:../source,sfr:../src,sfr:../include,sfr:../inc"

" shift+tab insert literal tab
inoremap <S-Tab> <C-V><Tab>

filetype plugin on
filetype plugin indent on
syntax on
set hidden

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd    " Show (partial) command in status line.
set showmatch  " Show matching brackets.
set smartcase  " Do smart case matching
set incsearch  " Incremental search
set mouse=v    " Enable mouse usage (all modes)
set number
set ruler
set hlsearch
set autoindent
set smartindent
set encoding=utf-8
set fileencoding=utf-8
syntax enable
set complete-=k
set history=10000
set backspace=indent,eol,start

" Spellfile;
set spellfile=$HOME/.vim/en.utf-8.add


" Mappings
source $HOME/.vim/mymappings.vim
au BufNewFile *.snw read ~/Scripts/template.snw 
au BufRead,BufNewFile *.nw set filetype=noweb
au BufRead,BufNewFile *.snippet set expandtab!
au BufRead,BufNewFile *.cu set filetype=cpp
au BufRead,BufNewFile *.vue setlocal iskeyword+=- |
            \ setlocal filetype=vue |
            \ setlocal ts=2 sw=2 
au BufRead,BufNewFile *.scad set filetype=openscad
au BufRead,BufNewFile *.snw set filetype=noweb
au BufRead,BufNewFile *.w set filetype=noweb
au BufRead,BufNewFile *.nw set spell spelllang=en
au BufRead,BufNewFile *.blog set filetype=markdown
au BufRead,BufNewFile *.labnote set filetype=tex
au BufRead,BufNewFile *.csv set filetype=csv
au BufRead,BufNewFile *.asy set filetype=cpp
au BufRead,BufNewFile *.yacml set filetype=dot
au BufRead,BufNewFile *.ino set filetype=cpp
au BufRead,BufNewFile *.gnu,*.gnuplot,*.plt,*.gpi set filetype=gnuplot
au BufRead,BufNewFile *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
au BufRead,BufNewFile wscript set filetype=python 
au BufRead *.lyx syntax sync fromstart
au BufRead,BufNewFile *.jinja2,*.jinja set ft=jinja

au BufRead,BufNewFile *.tex set spell spelllang=en
au BufEnter *.tex set nosmartindent

" Blog related setting.
au BufRead,BufNew *.blog setlocal spell spelllang=en 
au BufRead,BufNew *.blog setlocal complete+=k
au BufRead,BufNew *.md setlocal spell spelllang=en
au BufRead,BufNew *.md setlocal filetype=pandoc
au BufRead,BufNew *.md setlocal complete+=k
au BufRead,BufNew *.md setlocal spell spelllang=en
au BufRead,BufNew *.rst setlocal spell spelllang=en
" On tmp files do not wrap lines by inserting newline, wrap it without newline.
au BufRead,BufNew *.tmp setlocal wrap linebreak nolist 
au BufRead,BufNew *.txt setlocal wrap linebreak nolist 


au BufNewFile *.vhd read ~/.vim/template/template.vhd
" au BufRead,BufNewFile *.bsv set filetype=verilog
au BufRead,BufNewFile *.bsv set syntax=bsv
au BufRead,BufNewFile *.max set filetype=maxima  nospell
au BufRead,BufNewFile *.maxima set filetype=maxima nospell
au BufRead,BufNewFile *.mac set filetype=maxima nospell
au BufRead,BufNewFile *.maxima set filetype=maxima nospell
au BufRead,BufNewFile *.mc set filetype=maxima nospell
au BufRead,BufNewFile *.rules set filetype=make
au BufRead,BufNewFile *.tex set filetype=tex


set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!
let g:haddock_docdir= "/usr/share/doc/ghc/html/"
source $HOME/.vim/methods.vim 

" default
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set textwidth=79
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set wrap
set iskeyword+=_
set autoread
set showmatch
set errorbells
" Create backup of all files.
set backup
set backupdir=~/vim-backup/,./.backup,/tmp,.
set undofile

let vimDir = '$HOME/.vim/'
let myUndoDir=expand(vimDir . '/undodir')
call system('mkdir -p ' . myUndoDir)
let &undodir = myUndoDir
set undofile

"" Read pdf file in vim
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" clipboard
set clipboard=unnamedplus

""" When xlipboard support is not available
:command -range Cz :silent :<line1>,<line2>w !xsel -i -b
:command -range Cx :silent :<line1>,<line2>w !xsel -i -p
:command -range Cv :silent :<line1>,<line2>w !xsel -i -s
:cabbrev cv Cv
:cabbrev cz Cz
:cabbrev cx Cx

:command -range Pz :silent :r !xsel -o -b
:command -range Px :silent :r !xsel -o -p
:command -range Pv :silent :r !xsel -o -s

:cabbrev pz Pz
:cabbrev px Px
:cabbrev pv Pv

" For mac
set clipboard=unnamed
" Diffdir options
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*/.git/*"

" Syntastic is very slow with pylint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Nerd Commentor 
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" Doxygen 
let g:DoxygenToolkit_authorName="Dilawar Singh <dilawar.s.rajput@gmail.com>"
let g:DoxygenToolkit_licenseTag="MIT"  

let g:pandoc#biblio#use_bibtool=1
let g:pandoc#modules#disabled=[ "folding", "formatting" ]
let g:pandoc#formatting#mode="sA"
let g:pandoc#spell#enabled=1
" let g:pandoc#after#modules#enabled=["supertab"]
let g:pandoc#syntax#conceal#use = 0

" VIMRC
set shortmess=a
set cmdheight=2

" wildcard
set wildmode=longest,list,full
set wildmenu
set conceallevel=0

" SOURCE: https://vim.fandom.com/wiki/Insert_current_filename
:inoremap \fn <C-R>=expand("%:t")<CR>

" Else vim might look colors in tmux/screen.
set notermguicolors

" errorfmt
set errorformat^=%-G%f:%l:\ warning:%m
set errorformat^=%-G%f:%l:\ note:%m
