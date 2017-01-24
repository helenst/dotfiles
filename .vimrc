set nocompatible
" filetype must be off for vundle
filetype off

" Set up vundle
" Do this first:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ~~~~~~~~~~~~~~~~~~~~~~
" Vundle plugins go here
" ~~~~~~~~~~~~~~~~~~~~~~

" Let vundle manage itself
Plugin 'gmarik/vundle'

Plugin 'editorconfig/editorconfig-vim'

" File navigation
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'scrooloose/nerdtree'

" Python integration
Plugin 'klen/python-mode'
Plugin 'tclem/vim-arduino'

" Ruby linting
Plugin 'ngmy/vim-rubocop'

" Source control integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'

" Colors!
Plugin 'flazz/vim-colorschemes'

" Font size adjustment
Plugin 'drmikehenry/vim-fontsize'

filetype on

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
set noexpandtab       " use tabs by default

" allow toggling between local and default mode
if !exists("*TabToggle")
  function TabToggle()
    if &expandtab
      set shiftwidth=4
      set softtabstop=0
      set noexpandtab
    else
      set shiftwidth=4
      set softtabstop=4
      set expandtab
    endif
  endfunction
  nmap <F9> mz:execute TabToggle()<CR>'z
endif

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
autocmd BufRead,BufNewFile *.kv setlocal filetype=kivy
autocmd BufRead,BufNewFile *.less setlocal filetype=less
autocmd BufRead,BufNewFile *.scss setlocal filetype=sass
autocmd BufRead,BufNewFile *.pde setlocal filetype=arduino
autocmd BufRead,BufNewFile *.ino setlocal filetype=arduino
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown

" HTML - 2 spaces. Also, no wrapping since lines get quite long but we want
" indentation to be clear.
autocmd FileType html,htmldjango,xml,xsd,xslt setlocal nowrap tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" CSS / SASS / LESS - 2 spaces
autocmd FileType css,sass,less setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" Various languages: 2 spaces
autocmd FileType ruby,javascript,scala,erlang,haskell,clojure,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" Python: 4 spaces
autocmd FileType python,kivy setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" Markdown: wrap whole words
autocmd FileType markdown setlocal nolist lbr formatoptions+=l

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

" Don't let pymode autoedit whitespace
let g:pymode_trim_whitespaces = 0

" Don't let pymode worry about long lines
let g:pep8_ignore="E501,E226"
let g:pymode_lint_ignore="E501,E226"

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" I just don't trust rope anymore.
let g:pymode_rope = 0

" Use vim-signify for hg (for git, we have git-gutter)
let g:signify_vcs_list = ['hg']

" Don't show scratch window
set completeopt-=preview

" No, really don't create a new pane.
let g:pymode_lint_cwindow = 0

"
" Function key mappings
"

" F2 saves
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>

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

" python 3 print fixer
map ,3 :s/\vprint\s+(.+)$/print(\1)/ <CR>

" create an __init__.py in current NERDTree folder
map ,i ma__init__.py<CR>

let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '^__pycache__$']

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

" colorscheme. I use dark terminals so this works for me!
set background=dark
colorscheme vividchalk

" Put extra local .vim files into ~/.vim/plugin and they will be loaded automatically
