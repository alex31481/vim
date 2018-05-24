if &compatible
  set nocompatible
endif
"
"
" Neovim-qt Guifont command
  command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"
if has('win32') 
  " Set the font to DejaVu Sans Mono:h13
  " Guifont DejaVu Sans Mono:h13
  " Guifont Inconsolata:h12
  Guifont DejaVu Sans Mono for Powerline:h13
else
  let bundlePath='~/.config/nvim/plugged'
endif
"Guifont Ubuntu Mono derivative Powerline Regular:h12
"
filetype off                  " required
set encoding=utf8

call plug#begin(bundlePath)
Plug 'ryanoasis/vim-devicons'
Plug 'mhartington/oceanic-next'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-bufferline'
"Tim Pope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"Shuogo
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
"Plug 'Shougo/deoplete.vim'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
"Plug 'dai-shi/es-beautifier', { 'do': 'npm install --only=production' }
"Javascript
"Plug 'pangloss/vim-javascript'
"
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/Javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'benjie/neomake-local-eslint.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'sbdchd/neoformat'

"Plug 'maksimr/vim-jsbeautify', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'fleischie/vim-styled-components'
Plug 'mbbill/undotree'
"Typescript
"Plug 'leafgarland/typescript-vim'
"Plug 'mhartington/deoplete-typescript'
"Css
Plug 'hail2u/vim-css-syntax'
"General linting
Plug 'neomake/neomake'
"Silver searcher
Plug 'rking/ag.vim'
" Auto format
" Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
" Scala
Plug 'derekwyatt/vim-scala', { 'for' : 'scala'}
" elm
Plug 'ElmCast/elm-vim', { 'for' : 'elm' }
Plug 'avh4/elm-format', { 'for' : 'elm' }
" Docker
Plug 'ekalinin/Dockerfile.vim'
"move
Plug 'matze/vim-move'
"markdown
" Plug 'tpope/vim-markdown' ,
" Plug 'suan/vim-instant-markdown' , { 'for' : 'markdown' }
Plug 'GEverding/vim-hocon'
Plug 'stephpy/vim-yaml'

Plug 'dag/vim-fish', { 'for': 'fish' }
call plug#end()
filetype plugin indent on    " required

" Theme Oceanic Next Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if(has("termguicolors"))
  set termguicolors
endif

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_disable_end_of_buffer = 1 
colorscheme OceanicNext
" set background=dark
let mapleader = ',' 
let g:mapleader = ','

""""""""""""""""""""""""""
"UNDO 
"""""""""""""""""""""""
if has("persistent_undo")
  set undodir=~/.vim-undo/
  set undofile
endif



""""""""""""""""""""""""""""""""""""""""""
"Status line
""""""""""""""""""""""""""""""""""""""""""
" set statusline=%<%f\    " Filename
"set statusline+=%w%h%m%r " Options
" set statusline+=%#warningmsg#
" set statusline+=%{fugitive#statusline()}
" set statusline+=%*
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

let g:airline_section_c = '%t'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.maxlinenr = '☰'
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = '∄'
" let g:airline_symbols.whitespace = 'Ξ'

""""""""""""""""""""""""""""""""""""""""""
"Auto Complete
""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
"let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

""""""""""""""""""""""""""""""""""""""""""
"UltiSnip 
""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-i>"
let g:UltiSnipsJumpBackwardTrigger="<c-,>"
let g:UltiSnipsListSnippets = "<c-l>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""
"emmet
""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_install_global = 1
"autocmd FileType html,css EmmetInstall
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
"Javascript syntax
let g:used_javascript_libs = 'ramda,react,flux,chai'
"css
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

"easymotion search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"smart case easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout

nmap <space>e <Plug>(easymotion-s2)

" jsbeautify
" autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsxBeautify()<cr>
" autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
" autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
" autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
" autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
"

autocmd FileType javascript nnoremap <buffer> <space>f :call EsBeautifier()<cr>
autocmd FileType javascript vnoremap <buffer> <space>f :call RangeEsBeautifier()<cr>

"vim move bindings
let g:move_key_modifier = 'C'

""""""""""""""""""""""""""""""""""""""""""
"Unite configuration
""""""""""""""""""""""""""""""""""""""""""
nmap <C-p> :Unite buffer file_rec/git<CR>
	" Start insert.
call unite#custom#profile('default', 'context', {
\   'start_insert': 1
\ })

	" Like ctrlp.vim settings.
	"call unite#custom#profile('default', 'context', {
	"\   'start_insert': 1,
	"\   'winheight': 10,
	"\   'direction': 'botright',
	"\ })

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  "imap <buffer> jk      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  nmap <buffer><C-p> :UniteClose<CR> 
  imap <buffer><C-p> :UniteClose<CR> 
  imap <buffer><expr> j unite#smart_map('j', '')
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  imap <buffer><expr> x
          \ unite#smart_map('x', "\<Plug>(unite_quick_match_jump)")
  nmap <buffer> x     <Plug>(unite_quick_match_jump)
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
  nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  nnoremap <silent><buffer><expr> l
          \ unite#smart_map('l', unite#do_action('default'))

  let unite = unite#get_current_unite()
  if unite.profile_name ==# 'search'
    nnoremap <silent><buffer><expr> r     unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r     unite#do_action('rename')
  endif

  nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
  nnoremap <buffer><expr> S      unite#mappings#set_current_sorters(
          \ empty(unite#mappings#get_current_sorters()) ?
          \ ['sorter_reverse'] : [])

  " Runs "split" action by <C-s>.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')
  nmap <silent><buffer><expr> <C-s>     unite#do_action('split')
  nmap <silent><buffer><expr> S     unite#do_action('split')
  imap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
  nmap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
  nmap <silent><buffer><expr> V     unite#do_action('vsplit')
endfunction"}}}



"Auto Complete
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#mappings#close_popup() . "\<CR>"
endfunction

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd BufWritePost,BufEnter *.js Neomake


" Neoformat
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --no-semi\ --trailing-comma\ es5
" Use formatprg when available
let g:neoformat_try_formatprg = 1

" Fix my js
" autocmd FileType javascript noremap <Leader>f :w<CR> :silent exec "!eslint ".expand("%.p")." --fix"<CR> :Neomake<CR>
autocmd FileType javascript noremap <silent> <Leader>f :w<CR> :!yarn lint:fix-file %<CR> :edit<CR> :Neoformat<CR>:Neomake<CR>
autocmd FileType javascript.jsx noremap <silent> <Leader>f :w<CR> :!yarn lint:fix-file %<CR> :edit<CR> :Neoformat<CR>:Neomake<CR>
" Silver Searcher
nmap <leader>A :Ag <C-R><C-W>

" Silver Searcher


" Basic settings
"Line numbers number
set number
autocmd BufEnter * :set relativenumber
autocmd BufLeave * :set norelativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd InsertEnter * :set cul
autocmd InsertLeave * :set nocul
let loaded_matchparen = 1
  
set laststatus=2


"Height of the command bar
set cmdheight=1

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
" set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set backspace=2

imap jk <esc>
imap kj <esc>
nmap ; :
nmap <leader>s :w<cr>

"""""""""""""""
"Faster editing
"""""""""""""""
"change word case
nmap <Leader>c viw~ 
"replace line
"nmap <Leader>rl pk"_dd
"replace word
nmap <Leader>rw "_diwP
"paste register 0
nmap <Leader>p "0p
nmap <Leader>P "0P
nmap <Leader>n :NERDTreeFind<cr>
cmap W w !sudo tee > /dev/null %

nnoremap <F5> :UndotreeToggle<cr>
nnoremap <F2> :set invpaste paste?<cr>

""""""""""""""""""""""""
" Terminal settings
""""""""""""""""""""""
autocmd TermOpen * set bufhidden=hide
autocmd TermOpen * set textwidth=0
autocmd TermOpen * set wrapmargin=0
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


"""""""""""""""""""""""""
" wepack needs this configurate in order to watch
"""""""""""""""""""""""""""""""
set backupcopy=yes

"  move text and rehighlight -- vim tip_id=224 
vnoremap > ><CR>gv 
vnoremap < <<CR>gv 

"copy and paste toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set autoread
set autowriteall

"sets how many lines of history VIM has to remember
set history=1000
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
" set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set backspace=2


"""""""""""""""""""""
" transparent neovim
"""""""""""""
hi Normal guibg=none


"-- pandoc Markdown+LaTeX -------------------------------------------

function s:MDSettings()
    inoremap <buffer> <Leader>n \note[item]{}<Esc>i
    noremap <buffer> <Leader>b :! pandoc -t beamer % -o %<.pdf<CR><CR>
    noremap <buffer> <Leader>l :! pandoc -t latex % -o %<.pdf<CR>
    noremap <buffer> <Leader>v :! evince %<.pdf 2>&1 >/dev/null &<CR><CR>

    " adjust syntax highlighting for LaTeX parts
    "   inline formulas:
    syntax region Statement oneline matchgroup=Delimiter start="\$" end="\$"
    "   environments:
    syntax region Statement matchgroup=Delimiter start="\\begin{.*}" end="\\end{.*}" contains=Statement
    "   commands:
    syntax region Statement matchgroup=Delimiter start="{" end="}" contains=Statement
endfunction

autocmd BufRead,BufNewFile *.md setfiletype markdown
autocmd FileType markdown :call <SID>MDSettings()


hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
