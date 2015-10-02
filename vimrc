set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc() 
Bundle 'gmarik/vundle'
Bundle 'surround.vim'
"Bundle 'bling/vim-airline'
Bundle 'vim-scripts/a.vim'
"Bundle 'vim-scripts/DrawIt'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'vim-scripts/check-mutt-attachments.vim'
Bundle 'ervandew/supertab'

" Following three goes together
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle "garbas/vim-snipmate"
Bundle "lukerandall/haskellmode-vim"
Bundle "LaTex-Box-Team/LaTeX-Box"

Bundle "danchoi/elinks.vim"
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
"Bundle 'scrooloose/syntastic'
"Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/gist-vim'
Bundle "vim-scripts/csv.vim"
"Bundle 'Valloric/YouCompleteMe'


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
let g:C_UseTool_cmake = 'yes'
let g:C_UseTool_doxygen = 'yes'


" Mappings
source $HOME/.vim/mymappings.vim

" Supertab

"" Section for literate programming.
au BufNewFile *.nw read ~/Scripts/template.snw 
au BufRead,BufNewFile *.nw set filetype=noweb
au BufRead,BufNewFile *.snw set filetype=noweb
au BufRead,BufNewFile *.w set filetype=noweb
au BufRead,BufNewFile *.nw set spell spelllang=en
au BufRead,BufNewFile *.blog set filetype=markdown
au BufRead,BufNewFile *.markdown set filetype=markdown
au BufRead,BufNewFile *.csv set filetype=csv
au BufRead,BufNewFile *.yacml set filetype=dot

" Make pandoc behave like tex
au BufRead,BufNewFile *.md setlocal filetype=markdown |
    \ setlocal makeprg=markdown_to_pdf.sh\ %\ |

au BufRead,BufNewFile *.pandoc setlocal filetype=markdown |
    \ setlocal makeprg=markdown_to_pdf.sh\ %\ |

" Make pandoc behave like tex
au BufRead,BufNewFile *.anansi setlocal filetype=tex |
    \ setlocal makeprg=anansi.sh\ % |
    \ setlocal spell spelllang=en


let noweb_backend="tex"
let noweb_language="python"
let noweb_fold_code=0

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
colorscheme torte
set cc=+1
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" c-support

set errorformat+=%f:%l:\ %m
set errorformat^=%-G%f:%l:\ warning:%m

source $HOME/.vim/methods.vim 

"" SnipMate 
let g:snips_author = 'Dilawar Singh'
let g:snips_email = 'dilawars@ncbs.res.in'
let g:snippets_dir = '$HOME/.vim/snippets'

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['noweb'] = 'python,haskell'
let g:snipMate.scope_aliases['markdown'] = 'markdown,tex'

" Python related settings
autocmd BufRead *.py setlocal makeprg=pylint\ -E\ %:p
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
set patchmode=.clean
set backupdir=/tmp,.

"set foldmethod=syntax
"set foldnestmax=2
let g:dbext_default_profile_sqlite_for_rails = 'type=SQLITE:dbname=./sqlite.db'
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

" statusline
set statusline=2

"" Read pdf file in vim
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

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
