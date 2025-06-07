set pyx=3

call plug#begin("~/.vim/plugged")

Plug 'gmarik/vundle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'
Plug 'vim-scripts/DrawIt'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'will133/vim-dirdiff'
Plug 'scrooloose/nerdtree'

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" always|never|preserve
" default: 'preserve'
let g:prettier#config#prose_wrap = 'always'


Plug 'mhinz/vim-grepper'
nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool git<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['rg', 'git', 'ag']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 1

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'tpope/vim-surround'
" Thanks https://vi.stackexchange.com/a/2985/7610
nmap <silent> dsf ds)db  " bar(foo(x, y, z)) -> foo(x, y, z)

" alternate
Plug 'dilawar/a.vim'

" doc
Plug 'kkoomen/vim-doge'
Plug 'etlamb/DoxygenToolkit.vim'
Plug 'coyotebush/vim-pweave'

" cmake
" Plug 'cdelledonne/vim-cmake'

" Just
Plug 'NoahTheDuke/vim-just'

" Grammar
Plug 'rhysd/vim-grammarous'

" Tabular
Plug 'godlygeek/tabular'

" php support.
Plug 'biinari/php.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'noahfrederick/vim-laravel'

Plug 'tpope/vim-dispatch'             "| Optional
Plug 'tpope/vim-projectionist'        "|
Plug 'noahfrederick/vim-composer'     "|

" ALE
let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_cpp_gcc_options = '-std=c++17'
let g:ale_tex_chktex_options = '-n26 -n18'
let g:ale_linters = {
            \ 'python' : [ 'ruff', 'pylint', 'pyflakes' ],
            \ 'rust' : [ 'analyzer' ],
            \ 'javascript' : [ 'biome', 'eslint'],
            \ 'typescript' : [ 'tsserver', 'eslint', 'prettier'],
            \ 'typescriptreact' : [ 'tsserver', 'eslint', 'prettier'],
            \ 'xml' : [ 'xmllint'],
            \ 'php' : [ 'phpstan', 'php_cs_fixer', 'php'],
            \}

let g:ale_linter_aliases = {'vue': ['css', 'javascript', 'typescript']}

let g:ale_php_phpstan_executable='./vendor/bin/phpstan'
let g:ale_php_phpcs_executable='./vendor/bin/phpcs'
let g:ale_php_php_cs_fixer_executable='./vendor/bin/php-cs-fixer'
let g:ale_php_psalm_executable='./vendor/bin/psalm'

let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['prettier'],
            \   'css': ['prettier'],
            \   'python' : ['ruff'],
            \   'rust' : ['rustfmt'],
            \   'php' : ['php_cs_fixer'],
            \   'xml' : ['xmllint'],
            \}

let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_rls_config = {
                \   'rust': {
                \     'clippy_preference': 'on'
                \   }
                \ }
" let omnifunc=ale#completion#OmniFunc


" Frontend
Plug 'peitalin/vim-jsx-typescript'
Plug 'posva/vim-vue'
Plug 'heavenshell/vim-jsdoc', {
    \ 'for': ['javascript', 'javascript.jsx','typescript', 'vue'],
    \ 'do': 'make install'
\}

Plug 'vim-scripts/check-mutt-attachments.vim'
Plug 'itchyny/calendar.vim'
" Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"" Python
" Plug 'python-rope/ropevim'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
" let g:pydocstring_doq_path = expand("$HOME/.local/bin/doq")
let g:pydocstring_formatter = "numpy"
Plug 'pixelneo/vim-python-docstring'
let g:python_style =  'numpy'

" tags
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_ctags_exclude=["builds/*", "build/*", "target/*", "vendor/*"]
let g:gutentags_generate_on_write = 0
let g:gutentags_generate_on_new = 1

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" nim
Plug 'zah/nim.vim'
fun! JumpToDef()
    if exists("*GotoDefinition_" . &filetype)
        call GotoDefinition_{&filetype}()
    else
        exe "norm! \<C-]>"
    endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>


Plug 'dilawar/better-indent-support-for-php-with-html'
Plug 'alexandersix/vim-blade'

autocmd BufRead,BufNewFile *.blade.php set filetype=php


" diff mergetool
Plug 'samoshkin/vim-mergetool'
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'

" Python
" jedi does not work well when different version of python are installed. Never
" figured out what is the issue and life feels short to have such a fun!
" Plug 'davidhalter/jedi-vim'

" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" let g:pymode_warnings=1
Plug 'dilawar/vim-mypy'

" Nim
Plug 'zah/nim.vim'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" clang-format'
Plug 'rhysd/vim-clang-format'
let g:clang_format#style_options = {"BasedOnStyle" : "Mozilla"}

Plug 'chrisbra/unicode.vim'
" Turn TeX symbols into unicode.
Plug 'dilawar/vim-unicoder'
Plug 'bling/vim-airline'
Plug 'lervag/vimtex'
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdcommenter'

Plug 'alvan/vim-closetag'
let g:closetag_filetypes = 'html,xml,xsl,php,js,vue'

" Rust
Plug 'rust-lang/rust.vim'
let g:rustfmt_command = 'rustfmt'
let g:rustfmt_options = '--edition 2021'
let g:rustfmt_autosave = 0

" Vim backup.
set backup
set writebackup
set backupdir=~/.vim/backup
au BufWritePre * let &bex = '@' . strftime("%F.%H-%M")

"" jupyter
" Plug 'jupyter-vim/jupyter-vim'
Plug 'ervandew/supertab'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

call plug#end()


" vimtex
let g:tex_flavor="latex"

" colorscheme
" set background=dark
colorscheme gruvbox


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
set mouse=a    " Enable mouse usage (all modes)
set number
set ruler
set hlsearch
set autoindent
set smartindent
set encoding=utf-8
set fileencoding=utf-8
syntax enable
set history=10000
set backspace=indent,eol,start

" default
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set textwidth=80
set colorcolumn=88
highlight ColorColumn ctermbg=magenta guibg=lightgrey
set wrap
set iskeyword+=_
set autoread
set showmatch
set errorbells

" always prefer unix encoding
autocmd BufWrite * :set ff=unix

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

" " errorfmt
" set errorformat^=%-G%f:%l:\ warning:%m
" set errorformat^=%-G%f:%l:\ note:%m

set complete-=i

au BufNewFile *.snw read ~/Scripts/template.snw
au BufRead,BufNewFile *.nw set filetype=noweb
au BufRead,BufNewFile *.snippet set expandtab!
au BufRead,BufNewFile *.cu set filetype=cpp
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
au BufRead,BufNew *.md setlocal filetype=mardown
au BufRead,BufNew *.md setlocal complete+=k
au BufRead,BufNew *.md setlocal spell spelllang=en
au BufRead,BufNew *.rst setlocal spell spelllang=en
" On tmp files do not wrap lines by inserting newline, wrap it without newline.
au BufRead,BufNew *.tmp setlocal wrap linebreak nolist
au BufRead,BufNew *.txt setlocal wrap linebreak nolist
au BufRead,BufNew *.py setlocal comments+=:#'   " #' is used  by pyweave.


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
au BufRead,BufNewFile *.vue set ts=2 sw=2 expandtab
au BufRead,BufNewFile *.plantuml set filetype=plantuml
