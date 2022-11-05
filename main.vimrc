source ~/editor-config/base.vimrc

if has("gui_running")
	autocmd GUIEnter * set vb t_vb=
  " set term=xterm-256color
  if has("win32")
    set term=win32
  else
    set term=xterm-256color
  endif
  colorscheme OceanicNext
  let g:airline_theme='oceanicnext'
else
  if(has("win32") || has("win16"))
    colorscheme industry
  else
    colorscheme OceanicNext
    let g:airline_theme='oceanicnext'
  "  colorscheme mustang
  " else
  "   colorscheme lucius
  "   LuciusBlack
  endif
endif

set background=dark
" let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
