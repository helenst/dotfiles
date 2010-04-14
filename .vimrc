scriptencoding utf-8

set modeline	" enable modelines to be read

set bs=2		" allow backspacing over everything

set ruler		" show current coords of cursor
set nu			" line numbering

set ttymouse=xterm2		" allows mouse to work in screen sessions
set mouse=a		" allow mouse support in console

set bg=dark

"
" Searching
"
set ignorecase	" case insensitive searching
set incsearch	" search as you type


"
" Tabbing
"
set autoindent      " auto indent on new line
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab       " use tabs by default

set formatoptions=ro " Enable automatic comment leaders

" set the title of the terminal to the name of the file you are editing
set title
set titleold=""

" command line completion
set wildmode=list:longest,full


" enable filetype plugins
filetype plugin on
filetype indent on

" Funny file extensions
autocmd BufRead,BufNewFile *.spv setlocal filetype=php
autocmd BufRead,BufNewFile *.pxl setlocal filetype=python
autocmd BufRead,BufNewFile *.pxlt setlocal filetype=python

" HTML / XML / XSL shouldn't be wrapped - makes it too hard to see indentation
autocmd FileType html,xml,xslt setlocal nowrap

" Use spaces instead of tabs in python
autocmd FileType python setlocal expandtab

syntax enable " syntax highlighting

" ToDo keywords
syn keyword Todo contained TODO FIX FIXME XXX HACK
syn keyword pythonTodo contained TODO FIX FIXME XXX HACK

" Python PEP8 checking - requires pep8.py somewhere in the $PATH
" Control-P to run a PEP8 check on the current file...
nnoremap <silent> <C-p> :cexpr system("pep8.py --repeat ".expand("%:p"))<CR>
" Then Control-J and Control-K to move between the 'errors'
nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprevious<CR>

"
" Function key mappings
"
nmap <silent> <F4> :set invhlsearch<CR> " Toggle search highlighting

" F5 toggles the invpaste setting - 
" this stops auto-indentation going nuts when you paste stuff in terminal
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

nmap <silent> <F6> :set invlist<CR> " Toggle whitespace display
            

" Edit/save another file in the same directory as the current file
" uses expression to extract path from current file's path
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,sp :sp <C-R>=expand("%:p:h") . "/" <CR>
map ,vsp :vsp <C-R>=expand("%:p:h") . "/" <CR>
map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
map ,sav :sav <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Ctrl arrows to move between windows
noremap <Esc>[1;5D <C-W><Left>
noremap <Esc>[1;5C <C-W><Right>
noremap <Esc>[1;5A <C-W><Up>
noremap <Esc>[1;5B <C-W><Down>

noremap <C-Left>  <C-W><Left>
noremap <C-Right> <C-W><Right>
noremap <C-Up>    <C-W><Up>
noremap <C-Down>  <C-W><Down>

" Move text, but keep selection
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" NERD_tree should ignore .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$']
