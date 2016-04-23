" Neovim-qt Guifont command
command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"
" Set the font to DejaVu Sans Mono:h13
" Guifont DejaVu Sans Mono:h13
" Guifont Inconsolata:h12
Guifont DejaVu Sans Mono for Powerline:h13
" Guifont Ubuntu Mono derivative Powerline Regular:h12

"add if with mac bundle path
let bundlePath = 'C:/nvim/nvim/plugged'
set rtp+=c:\nvim\nvim\bundle\Vundle.vim 


"setting to my preferred vim bundle location this location can be custom as you 
call vundle#begin(bundlePath)
Plugin 'mhartington/oceanic-next'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'easymotion/vim-easymotion'
"Tim Pope
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
"Shuogo
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'bling/vim-bufferline'
call vundle#end()  

""""""""""""""""""""""""""""
" VimPlug not working for windows for some reason
" Cannot install multiple plug in
""""""""""""""""""""""""""""
" call plug#begin(bundlePath)
" Plug 'mhartington/oceanic-next'
" Plug 'scrooloose/nerdtree'
" Plug 'vim-airline/vim-airline'
" Plug 'Yggdroot/indentLine'
" Plug 'easymotion/vim-easymotion'
"Tim Pope
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary'
"Shuogo
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimproc.vim'
" Plug 'bling/vim-bufferline'
" call plug#end()

" Theme Oceanic Next Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark
let mapleader = ',' 
let g:mapleader = ','



"Status line
" set statusline=%<%f\    " Filename
"set statusline+=%w%h%m%r " Options
" set statusline+=%#warningmsg#
" set statusline+=%{fugitive#statusline()}
" set statusline+=%*
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1

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

" Basic settings
"Line numbers number
set number
autocmd BufEnter * :set relativenumber
autocmd BufLeave * :set norelativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
  
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
