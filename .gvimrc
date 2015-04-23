
" Make font larger and smaller
" (see http://vim.wikia.com/wiki/Change_font_size_quickly for definitions)
if exists("*LargerFont")
	map <leader>+ :LargerFont<cr>
endif

if exists("*SmallerFont")
	map <leader>- :SmallerFont<cr>
endif


" get rid of menu and toolbar clutter
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R
