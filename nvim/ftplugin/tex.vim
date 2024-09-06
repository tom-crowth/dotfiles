
set conceallevel=2
"let g:vimtex_syntax_match_unicode

if !exists("g:vim_window_id")
	let g:vim_window_id = system("xdotool getactivewindow")
endif

function! s:TexFocusVim() abort
	sleep 200m
	execute "!xdotool windowfocus " . expand(g:vim_window_id)
	redraw!
endfunction

augroup vimtex_event_focus
	autocmd!
	autocmd User VimtexEventView call s:TexFocusVim()
augroup END

augroup vimtex_event_focus2
	autocmd!
	autocmd User VimtexEventViewReverse call s:TexFocusVim()
augroup END
