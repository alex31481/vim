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
" Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'scrooloose/syntastic'
Plugin 'tikhomirov/vim-glsl'
Plugin 'pangloss/vim-javascript'
"currently not using plsql with vim the compilation line support is just not there 
" Plugin 'talek/vorax4'
" jsx plugin
Plugin 'mxw/vim-jsx'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
" Plugin 'ujihisa/unite-colorscheme'
Plugin 'tpope/vim-fugitive'
Plugin 'tfnico/vim-gradle'
Plugin 'fatih/vim-go'
" Plugin 'jonathanfilip/vim-lucius'
Plugin 'dag/vim-fish'
Plugin 'sjl/threesome.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'ruanyl/vim-fixmyjs'
Plugin 'mhartington/oceanic-next'
"Plugin 'ervandew/SuperTab'
"Plugin 'mxw/vim-jsx'





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


syntax enable
set autoread
set autowriteall

set number

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
let g:delimitMate_expand_cr = 2 

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"lint stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["javascript"] }



"""""""""""""""""""""""""""
"" Setting time out to give more time for leader key combos
"""""""""""""""""""""""""""""""""""""
set timeout
set timeoutlen=1000
set ttimeoutlen=100

" associate sql with plsql syntax
au BufRead,BufNewFile *.sql setf=plsql

" ingored folders for ctrlp
" let g:ctrlp_custom_ignore = {
" 	\ 'dir':  '\v[\/](node_modules|bower_components|\.(git|hg|svn))$',
" 	\ 'file': '\v\.(exe|so|dll)$',
" 	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
" 	\ }

set t_Co=256
"no sound on error 
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
    colorscheme mustang
  " else
  "   colorscheme lucius
  "   LuciusBlack
  endif
endif

set background=dark


"Line numbers number
set number
autocmd BufEnter * :set relativenumber
autocmd BufLeave * :set norelativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

"Customized Key map
"caps lock
" map <c-m> :SyntasticToggleMode <cr>
"imap <C-u> <Plug>CapsLockToggle
"get out of edit mode
imap jk <esc>
imap kj <esc>
"to end a line 
imap EE <C-o>A;<esc> 
"nmap <Leader>l <Plug>CapsLockToggle
"faster navigation
" imap <C-h> <C-o>h
" imap <C-j> <C-o>j
" imap <C-k> <C-o>k
" imap <C-k> <esc>:hello
"imap <C-k> <Plug>(neosnippet_jump_or_expand)
" imap <C-l> <C-o>l
"faster grep tool
" nmap <Leader>g :vimgrep <C-R><C-W> .\**\*.* 
"faster saving

imap <C-s> <esc>:w<cr>
nmap <C-s> <esc>:w<cr>
nmap <Leader>n :NERDTree <cr>
"ag searcher
nmap <leader>a :Ag  
nmap <leader>A :Ag <C-R><C-W>
nmap ; :
nmap <C-p> :Unite file_rec/git buffer<cr>i
nmap <Space>s :w<cr> :SyntasticCheck<cr>
nmap <leader>f :Fixmyjs<cr> :w<cr> :SyntasticCheck<cr>
nmap <leader>s :w<cr>
" for word comletion

"""""""""""""""
"Faster editing
"""""""""""""""
"change word case
nmap <Leader>c viw~ 
"replace line
nmap <Leader>rl pk"_dd
"replace word
nmap <Leader>rw "_diwP
"paste register 0
nmap <Leader>p "0p
nmap <Leader>P "0P

"Status line
set statusline=%<%f\    " Filename
"set statusline+=%w%h%m%r " Options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*



"copy and paste toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

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


""""""""""""""""""""""""""""""""""""
"Shougo vim autocomplete stff
"""""""""""""""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-y>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" quick snippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
