" Neovim-qt Guifont command
command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"
" Set the font to DejaVu Sans Mono:h13
Guifont DejaVu Sans Mono:h12


call plug#begin('c:/nvim-config/nvim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

 " Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark

let mapleader = ',' 
let g:mapleader = ','

" Basic settings
"Line numbers number
set number
autocmd BufEnter * :set relativenumber
autocmd BufLeave * :set norelativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
  
set laststatus=2


"Height of the command bar
set cmdheight=2

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
" set noerrorbells
" set visualbell
" set t_vb=
" set tm=500


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

"Status line
set statusline=%<%f\    " Filename
"set statusline+=%w%h%m%r " Options
set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()}
set statusline+=%*
let g:airline_theme='oceanicnext'
