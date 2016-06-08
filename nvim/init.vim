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
" Guifont Ubuntu Mono derivative Powerline Regular:h12
"
filetype off                  " required

"add if with mac bundle path

" set rtp+=c:\nvim\nvim\bundle\Vundle.vim 
" "setting to my preferred vim bundle location this location can be custom as you 
" call vundle#begin(bundlePath)
" Plugin 'mhartington/oceanic-next'
" Plugin 'scrooloose/nerdtree'
" Plugin 'vim-airline/vim-airline'
" Plugin 'Yggdroot/indentLine'
" Plugin 'easymotion/vim-easymotion'
" "Tim Pope
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-commentary'
" "Shuogo
" Plugin 'Shougo/unite.vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'bling/vim-bufferline'
" " Plugin 'Shougo/deoplete.vim'
" Plugin 'ternjs/tern_for_vim'
" "Javascript
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
" call vundle#end()  


""""""""""""""""""""""""""""
" VimPlug not working for windows for some reason
" Cannot install multiple plug in
""""""""""""""""""""""""""""
"

"""""""""""""""""""""""""""
" VimPlug not working for windows for some reason
" Cannot install multiple plug in
"""""""""""""""""""""""""""
call plug#begin(bundlePath)
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
"Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"General linting
Plug 'neomake/neomake'
"Silver searcher
Plug 'rking/ag.vim'
call plug#end()
" Auto format
Plug 'Chiel92/vim-autoformat'
filetype plugin indent on    " required

" Theme Oceanic Next Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark
let mapleader = ',' 
let g:mapleader = ','



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

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

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

"Unite configurations 
nmap <C-p> :Unite buffer file_rec/git<cr>i



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

" Fix my js
autocmd FileType javascript noremap <Leader>f :w<CR> :silent exec "!eslint ".expand("%.p")." --fix"<CR> :Neomake<CR>

" Silver Searcher
nmap <leader>A :Ag <C-R><C-W>


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
nmap <Leader>n :NERDTree <cr>

nnoremap <F2> :set invpaste paste?<CR>

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


