scriptencoding utf-8

set modeline	" enable modelines to be read

set bs=2		" allow backspacing over everything

set ruler		" show current coords of cursor
set nu			" line numbering

set ttymouse=xterm2		" allows mouse to work in screen sessions
set mouse=a		" allow mouse support in console

"
" Searching
"
set ignorecase	" case insensitive searching
set incsearch	" search as you type


"
" Tabbing
"
set autoindent      " auto indent on new line
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab       " use spaces by default

set formatoptions=ro " Enable automatic comment leaders

" set the title of the terminal to the name of the file you are editing
set title
set titleold=""

" command line completion
set wildmode=list:longest,full

" fold level
set foldmethod=indent
set foldlevel=20
set foldlevelstart=20

" make tabs and trailing spaces visible
set list listchars=tab:▷⋅,trail:⋅

filetype plugin on
filetype indent on

" Funny file extensions
autocmd BufRead,BufNewFile *.spv setlocal filetype=php
autocmd BufRead,BufNewFile *.phtml setlocal filetype=php
autocmd BufRead,BufNewFile *.pxl setlocal filetype=python
autocmd BufRead,BufNewFile *.pxlt setlocal filetype=python
autocmd BufRead,BufNewFile *.less setlocal filetype=less
autocmd BufRead,BufNewFile *.scss setlocal filetype=sass
autocmd BufRead,BufNewFile *.pde set filetype=arduino
autocmd BufRead,BufNewFile *.ino set filetype=arduino

" No wrapping on html type stuff, too hard to see indents
autocmd FileType html,xml,xslt setlocal nowrap

syntax enable " syntax highlighting

" ToDo keywords
syn keyword Todo contained TODO FIX FIXME XXX HACK
syn keyword pythonTodo contained TODO FIX FIXME XXX HACK

" Python PEP8 checking - requires pep8.py somewhere in the $PATH
" Control-P to run a PEP8 check on the current file...
nnoremap <silent> <C-p> :cexpr system("pep8 --repeat ".expand("%:p"))<CR>
" Then Control-J and Control-K to move between the 'errors'
nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprevious<CR>

"
" Function key mappings
"

" Show/hide NERDTree
map <F3> :NERDTreeToggle<CR>

" Toggle search highlighting
nmap <silent> <F4> :set invhlsearch<CR>

" F5 toggles the invpaste setting - 
" this stops auto-indentation going nuts when you paste stuff in terminal
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

nmap <silent> <F6> :set invlist<CR> " Toggle whitespace display

map <F7> :TlistToggle<CR>

" Edit/save another file in the same directory as the current file
" uses expression to extract path from current file's path
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,sp :sp <C-R>=expand("%:p:h") . "/" <CR>
map ,vsp :vsp <C-R>=expand("%:p:h") . "/" <CR>
map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
map ,sav :sav <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>

" FuzzyFinder shortcut
map ,f :FufFile **/<CR>
map ,b :FufBuffer <CR>

let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.pyc$', '\.swp$']

" TagList Plugin Configuration
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1

set tags=tags;$HOME/.vim/tags/

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

vnoremap ;rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>

" Put extra local .vim files into ~/.vim/plugin and they will be loaded automatically
