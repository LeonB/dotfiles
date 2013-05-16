command! TodoList call s:TodoList()

function! s:TodoList()
	"Very magic regex
	"silent noautocmd vimgrep /\vTODO|FIXME/ **/*\.{py,txt,html,jinja,js}
	silent noautocmd vimgrep /\vTODO|FIXME/ **/*\.py **/*\.txt **/*\.html **/*\.jinja **/*\.js
	cwindow

	if &buftype == 'quickfix'
		resize 10
		let w:quickfix_title = 'To-do list'
	endif

	"set window fullscreen / only window
	"exe "normal! \<c-w>o"
	wincmd o
endfunction
