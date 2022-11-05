source ~/editor-config/base.vimrc

if has("gui_running")
	autocmd GUIEnter * set vb t_vb=
  " set term=xterm-256color
  if has("win32")
    set term=win32
  else
    set term=xterm-256color
  endif
  colorscheme oceanicnextlightLight
  let g:airline_theme='oceanicnextlight'
else
  if(has("win32") || has("win16"))
    colorscheme industry
  else
    colorscheme oceanicnextlightLight
    let g:airline_theme='oceanicnextlight'
  "  colorscheme mustang
  " else
  "   colorscheme lucius
  "   LuciusBlack
  endif
endif

set background=dark
let g:airline#extensions#tabline#enabled = 1
