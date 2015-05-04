"
""""""""""""""""""""
" Seetting a easy leader key
""""""""""""""""""
let mapleader = ',' 
let g:mapleader = ','
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


Plugin 'flazz/vim-colorschemes'
Plugin 'trusktr/seti.vim'

" Plugin 'jelera/vim-javascript-syntax'
Plugin 'tpope/vim-capslock'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'tikhomirov/vim-glsl'
Plugin 'pangloss/vim-javascript'
"currently not using plsql with vim the compilation line support is just not there 
" Plugin 'talek/vorax4'
"jsx plugin
Plugin 'mxw/vim-jsx'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"sets how many lines of history VIM has to remember
set history=1000

set t_Co=256


syntax enable

colorscheme seti


set autoread

set number

set laststatus=2

set background=dark

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
set noerrorbells
set novisualbell
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto format 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"javascript simple mapping 
"map <c-f> :call JsBeautify()<cr>
"format for all files

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"Auto Deliminate functionalities
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMat_expand_cr = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"lint stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%<%f\    " Filename
"set statusline+=%w%h%m%r " Options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0


"""""""""""""""""""""""""""
"" Setting time out to give more time for leader key combos
"""""""""""""""""""""""""""""""""""""
set timeout
set timeoutlen=1000
set ttimeoutlen=100

" associate sql with plsql syntax
au BufRead,BufNewFile *.sql setf=plsql

" ingored folders for ctrlp
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](node_modules|bower_components|\.(git|hg|svn))$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

"no sound on error 
if has("gui_running")
	autocmd GUIEnter * set vb t_vb=
endif

"Customized Keys 
"caps lock
map <c-m> :SyntasticToggleMode <cr>
imap <C-u> <Plug>CapsLockToggle
"get out of edit mode
imap zz <esc>
"to end a line 
imap EE <C-o>A;<esc> 
nmap <Leader>l <Plug>CapsLockToggle
"move between windows
nmap <Leader>w <C-w>w
imap WW <esc><C-w>w
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-s> <esc>:w<cr>
