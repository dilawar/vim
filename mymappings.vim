source $HOME/.vim/scripts/format_comment.vim

imap jj <Esc>
imap qq <C-P>
imap ww <C-N>
imap ddd <C-X><C-K>
noremap K i<CR><Esc>
nnoremap gr :grep <cword> *<CR>
nnoremap Gr :grep <cword> %:p:h/*<CR>
nnoremap gR :grep '\b<cword>\b' *<CR>
nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

" copy template to tex file 
nmap <leader>ttt :r ~/.vim/template/template.tex<cr>
imap <leader>ttt :r ~/.vim/template/template.tex<cr>

"copy current visual selection to ~/.vbuf
vmap <leader>y :w! ~/.vbuf<cr>

"copy current line to the buffer file if no visual selection
nmap <leader>y :.w! ~/.vbuf<cr>

"paste the content of the buffer file
nmap <leader>p :r ~/.vbuf<cr> 

inoremap <expr> dts strftime("%c")
inoremap \fn <C-R>=expand("%:t")<CR>

" break the lines from cursor position to the end and paste it on top of it.
nmap ,k d$O<Space><BS><Esc>p
" This mapping breaks the line in a bash stype. It appends the current line with
" \ before breaking it. Useful in python and bash.
nmap \j d$$a\<Esc>o<Space><BS><Esc>p
" This mapping does not introduce \ at the end. It breaks the line at cursor and
" moves to next position using ;
nmap ,j d$<Esc>o<Space><BS><Esc>p^;

""" Mapping to format the arguments.
" This mapping introduce a space just after the cursor position and moves to
" next pattern using ;, if any
nmap ,s a<Space><Esc>;
" This mapping introduces two spaces, one before and one after the cursor
" position. And then it moves to next location using ; if any.
nmap ,= a<Space><Esc>hi<Space><Esc>l;

" This mapping sorrounds. Keep your cursor in a place and execute it. it will go
" one word back and one word forward and sorround it this text with the bracket.
" Eg. tau / mau --> (tau / mau)
"     tau/mau --> (tau/mau)
nmap ,( Bi(<Esc>3Ea)<Esc>;
nmap ,[ Bi[<Esc>3Ea]<Esc>;
nmap ,{ Bi{<Esc>3Ea}<Esc>;

" Reload the vimrc file.
map <C-L> :source ~/.vim/vimrc<CR>

" Search in files. 
nnoremap gr :grep <cword> *<CR>
nnoremap Gr :grep <cword> %:p:h/*<CR>
nnoremap gR :grep '\b<cword>\b' *<CR>
nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

" Remove arrow keys 
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

imap ;;; <Plug>snipMateNextOrTrigger
map gqc :call FormatComment()<CR>

" Insert a  character n times.
function! Repeat()
    let times = input("Count: ")
    let char  = input("Char: ")
    exe ":normal a" . repeat(char, times)
endfunction
imap <C-r> <C-o>:call Repeat()<cr>

" Easy align plugins.
let g:easy_align_delimiters = {
    \ '>': { 'pattern': '>>\|=>\|>' },
    \ '/': {
    \     'pattern':         '//\+\|/\*\|\*/',
    \     'delimiter_align': 'l',
    \     'ignore_groups':   ['!Comment'] },
    \ ']': {
    \     'pattern':       '[[\]]',
    \     'left_margin':   0,
    \     'right_margin':  0,
    \     'stick_to_left': 0
    \   },
    \ ')': {
    \     'pattern':       '[()]',
    \     'left_margin':   0,
    \     'right_margin':  0,
    \     'stick_to_left': 0
    \   },
    \ 'd': {
    \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
    \     'left_margin':  0,
    \     'right_margin': 0
    \   }
    \ }

" Detect filetype using shebangs
if getline(1) =~ '^#!.*/bin/make.*'
    setfiletype make
endif

