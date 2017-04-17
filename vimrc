set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc() 
Bundle 'lervag/vimtex'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/DrawIt'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'vim-scripts/check-mutt-attachments.vim'
Bundle "will133/vim-dirdiff"
Bundle 'ervandew/supertab'
Bundle 'itchyny/calendar.vim'
"Plugin 'SirVer/ultisnips'

" Following two go hand in hand 
Bundle 'Shougo/vimproc.vim'
Bundle 'eagletmt/ghcmod-vim'

Bundle "rafi/awesome-vim-colorschemes"
"Plugin 'heavenshell/vim-pydocstring'
Plugin 'WolfgangMehner/vim-plugins'

" This script increase/descreses etc a selected column
"Plugin 'vim-scripts/VisIncr'

" Following three goes together
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'

Bundle 'easymotion/vim-easymotion'
Bundle "danchoi/elinks.vim"
Bundle 'scrooloose/nerdcommenter'
"Bundle "tpope/vim-commentary"
Bundle 'tpope/vim-fugitive'
Bundle "junegunn/vim-easy-align"
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
"Bundle 'mattn/gist-vim'
"Bundle "chrisbra/csv.vim"
"Bundle "JuliaLang/julia-vim"
"Bundle 'Valloric/YouCompleteMe'

"" Fakeclip
Bundle "kana/vim-fakeclip"

"" vim-latexsuite. Make it very easy to insert bibliography.
Bundle "vim-latex/vim-latex"


filetype plugin indent on

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
set nospell
set encoding=utf-8
"set spell spelllang=en
"" This option crashed vim in gentoo
" set dictionary+=/usr/share/dict/words
" no dictionary autocomplete. 
set complete-=k
set completeopt-=preview

syntax enable

" c-support
set makeprg=make
if filereadable("build_me.sh")
    set makeprg=./build_me.sh
endif
set wildmode=longest,list
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'


" Mappings
source $HOME/.vim/mymappings.vim

" Supertab

"" Section for literate programming.
au BufNewFile *.snw read ~/Scripts/template.snw 
au BufRead,BufNewFile *.nw set filetype=noweb
au BufRead,BufNewFile *.snw set filetype=noweb
au BufRead,BufNewFile *.w set filetype=noweb
au BufRead,BufNewFile *.nw set spell spelllang=en
au BufRead,BufNewFile *.blog set filetype=markdown
au BufRead,BufNewFile *.markdown set filetype=markdown
au BufRead,BufNewFile *.pandoc set filetype=markdown
au BufRead,BufNewFile *.labnote set filetype=markdown
au BufRead,BufNewFile *.csv set filetype=csv
au BufRead,BufNewFile *.asy set filetype=cpp
au BufRead,BufNewFile *.yacml set filetype=dot
au BufRead,BufNewFile *.ino set filetype=cpp
au BufRead,BufNewFile *.gnu,*.gnuplot,*.plt,*.gpi set filetype=gnuplot
au BufRead,BufNewFile *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
au BufRead,BufNewFile wscript set filetype=python 
au BufRead *.lyx syntax sync fromstart

" Make pandoc behave like tex
au BufRead,BufNewFile *.md setlocal filetype=markdown |
    \ setlocal makeprg=markdown_to_pdf.sh\ %\ |

au BufRead,BufNewFile *.pandoc setlocal filetype=tex |
    \ setlocal makeprg=pandoc2pdf.sh\ %\ |
    \ setlocal spell spelllang=en

au BufNewFile,BufRead *.context setlocal filetype=tex 

let noweb_backend="tex"
let noweb_language="haskell"
let noweb_fold_code=1

au BufRead,BufNewFile *.tex set spell spelllang=en
au BufEnter *.tex set nosmartindent

" Blog related setting.
au BufRead,BufNew *.blog setlocal spell spelllang=en 
au BufRead,BufNew *.blog setlocal complete+=k
au BufRead,BufNew *.md setlocal complete+=k
au BufRead,BufNew *.md setlocal spell spelllang=en
au BufRead,BufNew *.markdown setlocal complete+=k
au BufRead,BufNew *.markdown setlocal syntax=markdown
au BufRead,BufNew *.markdown setlocal spell spelllang=en
" On tmp files do not wrap lines by inserting newline, wrap it without newline.
au BufRead,BufNew *.tmp setlocal wrap linebreak nolist 
au BufRead,BufNew *.txt setlocal wrap linebreak nolist 


au BufNewFile *.vhd read ~/.vim/template/template.vhd
" au BufRead,BufNewFile *.bsv set filetype=verilog
au BufRead,BufNewFile *.bsv set syntax=bsv
au BufRead,BufNewFile *.max set filetype=maxima 
au BufRead,BufNewFile *.maxima set filetype=maxima
au BufRead,BufNewFile *.mac set filetype=maxima
au BufRead,BufNewFile *.rules set filetype=make

" vim-latexsuite mapping
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule = 'yap -1'
" Do not expand " to stupid quites.
let g:Tex_SmartKeyQuote = 0

set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!
" unicode \u2506
"let g:haddock_browser="/usr/bin/elinks"
let g:haddock_docdir= "/usr/share/doc/ghc/html/"


" colorscheme and all
if &diff 
    colorscheme torte
else
    "set bg=dark
    colorscheme torte
    set cc=+1
    hi ColorColumn ctermbg=lightgrey guibg=lightgrey
endif
""
""" colorscheme and all
""if &diff 
""    colorscheme torte
""else
""    set bg=dark
""    colorscheme torte
""endif
""
colorscheme default
set cc=+1
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" c-support

set errorformat+=%f:%l:\ %m
set errorformat^=%-G%f:%l:\ warning:%m

source $HOME/.vim/methods.vim 

""" SnipMate 
""" NOTE: Using ultisnips
let g:snips_author = 'Dilawar Singh'
let g:snips_email = 'dilawars@ncbs.res.in'
let g:snippets_dir = '$HOME/.vim/snippets'

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['noweb'] = 'python,haskell'
let g:snipMate.scope_aliases['markdown'] = 'markdown,tex'

" Python related settings
autocmd BufRead *.py setlocal makeprg=pylint\ \ %:p
let g:pymode_lint_write=0
let g:pymode_lint=0

"indent guide
"hi IndentGuidesOdd  ctermbg=white
"hi IndentGuidesEven ctermbg=lightgrey
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size=1

" default
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set textwidth=80
set wrap
set iskeyword+=_
set autoread
set showmatch
set errorbells
set backspace=2 "
" Create backup of all files.
set backup
set backupdir=~/vim-backup/,./.backup,/tmp,.
set undofile

let vimDir = '$HOME/.vim/'
let myUndoDir=expand(vimDir . '/undodir')
call system('mkdir -p ' . myUndoDir)
let &undodir = myUndoDir
set undofile

"set foldmethod=indent
"set foldnestmax=4
"set foldlevel=1

let g:dbext_default_profile_sqlite_for_rails = 'type=SQLITE:dbname=./sqlite.db'
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

" statusline
set statusline=2

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

augroup nonvim
   au!
   au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls* sil exe "!open " . shellescape(expand("%:p")) | bd | let &ft=&ft
   au BufRead *.ppt*,*.doc*,*.rtf let g:output_pdf = shellescape(expand("%:r") . ".pdf")
   au BufRead *.ppt*,*.doc*,*.rtf sil exe "!/home/dilawar/Scripts/any2pdf " . shellescape(expand("%:p"))
   au BufRead *.ppt*,*.doc*,*.rtf sil exe "!open " . g:output_pdf | bd | let &ft=&ft
augroup end


" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:haddock_browser = "firefox"

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" For mac
set clipboard=unnamed
" Diffdir options
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*/.git/*"

" Syntastic is very slow with pylint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = ' -std=c++11 '
