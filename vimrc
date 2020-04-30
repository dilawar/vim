set nocompatible
set rtp+=~/.vim/bundle/vundle/ 

call vundle#rc() 
Bundle 'gmarik/vundle'

"" LucHermite
Bundle 'tomtom/stakeholders_vim'
Bundle 'LucHermitte/lh-vim-lib'
Bundle 'LucHermitte/alternate-lite'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/DrawIt'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'vim-scripts/check-mutt-attachments.vim'
Bundle 'itchyny/calendar.vim'
" Bundle 'tpope/vim-dispatch'
Bundle 'godlygeek/tabular'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'vimwiki/vimwiki'
Bundle "tpope/vim-obsession"
Bundle "leafOfTree/vim-vue-plugin"

Bundle "heavenshell/vim-pydocstring"
let g:pydocstring_doq_path = expand("$HOME/.local/bin/doq")
let g:pydocstring_formatter = "numpy"

" php
Bundle "phpstan/vim-phpstan"
Bundle "stephpy/vim-php-cs-fixer"
Bundle "dilawar/better-indent-support-for-php-with-html"

" CloseTag and matching
Bundle "alvan/vim-closetag"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.php'

Bundle 'andymass/vim-matchup'
Bundle 'tmhedberg/matchit'
let loaded_matchit=1

" Fixup to pandoc template $if(key)$ $endif(key)$ syntax etc.
" FROM: https://stackoverflow.com/a/34645680/1805129
" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
" syn region math start=/\$\$/ end=/\$\$/
" inline math
" syn match math '\$[^$].\{-}\$'

" actually highlight the region we defined as "math"
hi link math Statement

"" beware of using python-mode with jedihttps://github.com/davidhalter/jedi-vim/issues/163
Bundle 'davidhalter/jedi-vim'
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"

" clang-format'
Bundle "rhysd/vim-clang-format"
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

Bundle 'chrisbra/unicode.vim'

" Turn TeX symbols into unicode.
Bundle 'dilawar/vim-unicoder'

" This script increase/descreses etc a selected column
Bundle "junegunn/vim-easy-align"

" Airline
Bundle 'bling/vim-airline'

" ALE
Bundle "w0rp/ale"
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_cpp_gcc_options = '-std=c++14'
let g:ale_tex_chktex_options = '-n26 -n18'
let g:ale_linters = {
            \ 'python' : [ 'pyflakes'], 
            \ 'php' : [ 'psalm', 'php'], 
            \}

"" Fakeclip
Bundle 'ervandew/supertab'



" vimtex
Bundle 'lervag/vimtex'

" colorscheme
Bundle 'flazz/vim-colorschemes'
colorscheme sol
" set background=dark


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
au BufRead,BufNewFile *.php setlocal ts=4 sw=4
au BufRead,BufNewFile *.js setlocal ts=3 sw=3
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
au BufRead,BufNew *.markdown setlocal complete+=k
au BufRead,BufNew *.markdown setlocal spell spelllang=en
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


""indent guide
"Bundle 'nathanaelkane/vim-indent-guides'
"hi IndentGuidesOdd  ctermbg=white
"hi IndentGuidesEven ctermbg=lightgrey
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size=1
"let g:indentLine_char="⁞"

" The very heavy plugin.
" Bundle 'Valloric/YouCompleteMe'

" default
set softtabstop=4
set shiftwidth=4
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
Bundle 'scrooloose/nerdcommenter'
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
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Dilawar Singh <dilawars@ncbs.res.in>"
let g:DoxygenToolkit_licenseTag="GNU-GPL v3"  

" Pandoc 
Bundle "vim-pandoc/vim-pandoc"
Bundle "vim-pandoc/vim-pandoc-syntax"
Bundle "vim-pandoc/vim-pandoc-after"
" let g:pandoc#biblio#use_bibtool=1
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

""" SnipMate 
""" NOTE: Using ultisnips
Bundle 'SirVer/ultisnips'
let g:snips_author="Dilawar Singh"
let g:snips_email="dilawars@ncbs.res.in"
let g:tex_conceal = ""    " Otherwise keep screwing up my tex.
"let g:UltiSnipsExpandTrigger="<C-Space>"
"let g:UltiSnipsJumpForwardTrigger="<C-Space>"
"let g:UltiSnipsJumpBackwardTrigger="<C-Shift><C-Space>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsExpandTrigger="<nop>"
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" Python related settings
au BufNewFile,BufRead *.py set comments+=b:#\'
let g:pymode_lint_write=0
let g:pymode_lint=0

" SOURCE: https://vim.fandom.com/wiki/Insert_current_filename
:inoremap \fn <C-R>=expand("%:t")<CR>

" Else vim might look colors in tmux/screen.
set notermguicolors

" errorfmt
set errorformat^=%-G%f:%l:\ warning:%m
set errorformat^=%-G%f:%l:\ note:%m
