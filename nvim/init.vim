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
" Ignore case when searching
set ignorecase

call plug#begin(bundlePath)
Plug 'ryanoasis/vim-devicons'
Plug 'mhartington/oceanic-next'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-bufferline'
Plug 'luochen1990/rainbow'
"Tim Pope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"Shuogo
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'https://github.com/m-kat/aws-vim'
"Plug 'Shougo/deoplete.vim'
" function! DoRemote(arg)
"   UpdateRemotePlugins
" endfunction
" Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
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
"Plug 'benjie/local-npm-bin.vim'
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'sbdchd/neoformat'
Plug 'plytophogy/vim-virtualenv', {'for': ['python']}

"Plug 'maksimr/vim-jsbeautify', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'fleischie/vim-styled-components'
Plug 'mbbill/undotree'
"Typescript
"Plug 'leafgarland/typescript-vim'
"Plug 'mhartington/deoplete-typescript'
"Css
Plug 'hail2u/vim-css-syntax'
"General linting
"Plug 'neomake/neomake'
"Plug 'benjie/neomake-local-eslint.vim', { 'for': ['javascript', 'javascript.jsx'] }
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
"Plug 'ruanyl/vim-fixmyjs'

Plug 'w0rp/ale'
Plug 'overcache/NeoSolarized'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'raghur/fruzzy', {'do': { -> fruzzy#install()}}
Plug 'justinmk/vim-sneak'

let g:sneak#use_ic_scs = 1


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
" colorscheme OceanicNextLight
set background=dark
"
"
"
" Default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin
" solarized vertSplitBar style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined
" or italicized" typefaces, simply assign 1 or 0 to the appropriate variable.
" Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

" Used to enable/disable "bold as bright" in Neovim terminal. If colors of bold
" text output by commands like `ls` aren't what you expect, you might want to
" try disabling this option. Default value:
let g:neosolarized_termBoldAsBright = 1


" colorscheme NeoSolarized


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
" let g:airline_theme='oceanicnextlight'
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
" let g:deoplete#enable_at_startup = 1
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
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
" if exists('g:plugs["tern_for_vim"]')
"   let g:tern_show_argument_hints = 'on_hold'
"   let g:tern_show_signature_in_pum = 1
"   autocmd FileType javascript setlocal omnifunc=tern#Complete
" endif

" Use deoplete.
" let g:deoplete#enable_at_startup = 1
" Use smartcase.
" call deoplete#custom#option({
" \ 'auto_complete_delay': 200,
" \ 'smart_case': v:true,
" \ })

" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#mappings#close_popup() . "\<CR>"
" endfunction

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
" let b:neomake_javascript_eslint_exe = GetNpmBin('eslint')
" let g:flow#flowpath = GetNpmBin('flow')

"autocmd BufWritePost,BufEnter *.js Neomake


" Neoformat
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --no-semi\ --trailing-comma\ es5
" Use formatprg when available
let g:neoformat_try_formatprg = 1

" Fix my js
"autocmd FileType javascript noremap <Leader>f :w<CR> :silent exec "!eslint ".expand("%.p")." --fix"<CR> :Neomake<CR>
"autocmd FileType javascript noremap <silent> <Leader>f :w<CR> :!yarn lint:fix-file %<CR> :edit<CR> :Neoformat<CR>:Neomake<CR>
"autocmd FileType javascript.jsx noremap <silent> <Leader>f :w<CR> :!yarn lint:fix-file %<CR> :edit<CR> :Neoformat<CR>:Neomake<CR>
"autocmd FileType javascript.jsx noremap <silent> <Leader>f :Fixmyjs<CR> :Neoformat<CR>
autocmd FileType javascript.jsx noremap <silent> <Leader>f :ALEFix<CR>
" Silver Searcher
nmap <leader>A :Ag <C-R><C-W>

" Silver Searcher
"
"
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [ 'eslint','prettier' ]
let g:ale_fix_on_save = 1
"let g:ale_javascript_prettier_eslint_options = '--single-quote --trailing-comma es5 --no-semi'


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


set incsearch
set scrolloff=8
set nohlsearch
set hidden
set noerrorbells
set noswapfile
set nobackup

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
"nmap <leader>s :w<cr>

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
"nmap <Leader>p "0p
"nmap <Leader>P "0P
nmap <Leader>n :NERDTreeFind<cr>
"cmap W w !sudo tee > /dev/null %

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

let g:rainbow_active = 1

	" Define mappings
	autocmd FileType denite call s:denite_my_settings()
	function! s:denite_my_settings() abort
	  nnoremap <silent><buffer><expr> <CR>
	  \ denite#do_map('do_action')
	  nnoremap <silent><buffer><expr> d
	  \ denite#do_map('do_action', 'delete')
	  nnoremap <silent><buffer><expr> p
	  \ denite#do_map('do_action', 'preview')
	  nnoremap <silent><buffer><expr> q
	  \ denite#do_map('quit')
	  nnoremap <silent><buffer><expr> i
	  \ denite#do_map('open_filter_buffer')
	  nnoremap <silent><buffer><expr> <Space>
	  \ denite#do_map('toggle_select').'j'
	endfunction

	autocmd FileType denite-filter call s:denite_filter_my_settings()
	function! s:denite_filter_my_settings() abort
	  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	endfunction

	" Change file/rec command.
	" call denite#custom#var('file/rec', 'command',
	" \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
	" For ripgrep
	" Note: rg is faster than ag
	call denite#custom#var('file/rec', 'command',
	\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
	" " For Pt(the platinum searcher)
	" " NOTE: It also supports windows.
	" call denite#custom#var('file/rec', 'command',
	" \ ['pt', '--follow', '--nocolor', '--nogroup',
	" \  (has('win32') ? '-g:' : '-g='), ''])
	" " For python script scantree.py
	" " Read bellow on this file to learn more about scantree.py
	" call denite#custom#var('file/rec', 'command',
	" \ ['scantree.py', '--path', ':directory'])



  " optional - but recommended - see below
  let g:fruzzy#usenative = 1

  " When there's no input, fruzzy can sort entries based on how similar they are to the current buffer
  " For ex: if you're on /path/to/somefile.h, then on opening denite, /path/to/somefile.cpp
  " would appear on the top of the list.
  " Useful if you're bouncing a lot between similar files.
  " To turn off this behavior, set the variable below  to 0

  let g:fruzzy#sortonempty = 1 " default value

  " tell denite to use this matcher by default for all sources
  call denite#custom#source('_', 'matchers', ['matcher/fruzzy'])


	" " Change matchers.
	" call denite#custom#source(
	" \ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
	" call denite#custom#source(
	" \ 'file/rec', 'matchers', ['matcher/cpsm'])

	" Change sorters.
	call denite#custom#source(
	\ 'file/rec', 'sorters', ['sorter/sublime'])

	" Change default action.
	call denite#custom#kind('file', 'default_action', 'split')

	" Add custom menus
	let s:menus = {}

	let s:menus.zsh = {
		\ 'description': 'Edit your import zsh configuration'
		\ }
	let s:menus.zsh.file_candidates = [
		\ ['zshrc', '~/.config/zsh/.zshrc'],
		\ ['zshenv', '~/.zshenv'],
		\ ]

	let s:menus.my_commands = {
		\ 'description': 'Example commands'
		\ }
	let s:menus.my_commands.command_candidates = [
		\ ['Split the window', 'vnew'],
		\ ['Open zsh menu', 'Denite menu:zsh'],
		\ ['Format code', 'FormatCode', 'go,python'],
		\ ]

	call denite#custom#var('menu', 'menus', s:menus)

	" Ag command on grep source
	" call denite#custom#var('grep', {
	" 	\ 'command': ['ag'],
	" 	\ 'default_opts': ['-i', '--vimgrep'],
	" 	\ 'recursive_opts': [],
	" 	\ 'pattern_opt': [],
	" 	\ 'separator': ['--'],
	" 	\ 'final_opts': [],
	" 	\ })

	" " Ack command on grep source
	" call denite#custom#var('grep', {
	" 	\ 'command': ['ack'],
	" 	\ 'default_opts': [
	" 	\   '--ackrc', $HOME.'/.ackrc', '-H', '-i',
	" 	\   '--nopager', '--nocolor', '--nogroup', '--column'
	" 	\ ],
	" 	\ 'recursive_opts': [],
	" 	\ 'pattern_opt': ['--match'],
	" 	\ 'separator': ['--'],
	" 	\ 'final_opts': [],
	" 	\ })

	" Ripgrep command on grep source
	call denite#custom#var('grep', {
		\ 'command': ['rg'],
		\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': ['--regexp'],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })

	" " Pt command on grep source
	" call denite#custom#var('grep', {
	" 	\ 'command': ['pt'],
	" 	\ 'default_opts': [
	" 	\   '-i', '--nogroup', '--nocolor', '--smart-case'],
	" 	\ 'recursive_opts': [],
	" 	\ 'pattern_opt': [],
	" 	\ 'separator': ['--'],
	" 	\ 'final_opts': [],
	" 	\ })

	" " jvgrep command on grep source
	" call denite#custom#var('grep', {
	" 	\ 'command': ['jvgrep'],
	" 	\ 'default_opts': ['-i'],
	" 	\ 'recursive_opts': ['-R'],
	" 	\ 'pattern_opt': [],
	" 	\ 'separator': [],
	" 	\ 'final_opts': [],
	" 	\ })

	" Specify multiple paths in grep source
	"call denite#start([{'name': 'grep',
	"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

	" Define alias
	" call denite#custom#alias('source', 'file/rec/git', 'file/rec')
	" call denite#custom#var('file/rec/git', 'command',
	"       \ ['git', 'ls-files', '-co', '--exclude-standard'])

	" call denite#custom#alias('source', 'file/rec/py', 'file/rec')
	" call denite#custom#var('file/rec/py', 'command',
	" \ ['scantree.py', '--path', ':directory'])

	" Change ignore_globs
	call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
	      \ [ '.git/', '.ropeproject/', '__pycache__/',
	      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

	" Custom action
	" Note: lambda function is not supported in Vim8.
	" call denite#custom#action('file', 'test',
	"       \ {context -> execute('let g:foo = 1')})
	" call denite#custom#action('file', 'test2',
	"       \ {context -> denite#do_action(
	"       \  context, 'open', context['targets'])})
	" " Source specific action
	" call denite#custom#action('source/file', 'test',
	"       \ {context -> execute('let g:bar = 1')})
  " call denite#custom#option('start-filter', 'true')

nnoremap <C-p> :Denite buffer file/rec<CR>
" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'default_opts',
"     \ ['-i', '--vimgrep'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])


" old denite stuff
" call denite#custom#var('file/rec', 'command',
" 	\ ['ag', '--follow', '--nocolor','-g', ''])
" call denite#custom#map(
" 	      \ 'insert',
" 	      \ '<C-n>',
" 	      \ '<denite:move_to_next_line>',
" 	      \ 'noremap'
" 	      \)
" call denite#custom#map(
"       \ 'insert',
"       \ '<C-p>',
"       \ '<denite:move_to_previous_line>',
"       \ 'noremap'
"       \)
" call denite#custom#map(
" 	      \ 'insert',
" 	      \ 'jk',
" 	      \ '<denite:enter_mode:normal>',
" 	      \ 'noremap'
" 	      \)
" call denite#custom#map(
" 	      \ 'insert',
" 	      \ 'kj',
" 	      \ '<denite:enter_mode:normal>',
" 	      \ 'noremap'
" 	      \)
" call denite#custom#map(
" 	      \ 'insert',
" 	      \ '<C-s>',
" 	      \ '<denite:do_action:vsplit>',
" 	      \ 'noremap'
" 	      \)
" call denite#custom#map(
" 	      \ 'insert',
" 	      \ '<C-i>',
" 	      \ '<denite:do_action:split>',
" 	      \ 'noremap'
" 	      \)
" call denite#custom#map(
" 	      \ 'normal',
" 	      \ 's',
" 	      \ '<denite:do_action:vsplit>',
" 	      \ 'noremap'
" 	      \)
" call denite#custom#map(
" 	      \ 'normal',
" 	      \ 'i',
" 	      \ '<denite:do_action:split>',
" 	      \ 'noremap'
" 	      \)

" call denite#custom#option('default', {
"       \ 'prompt': '❯'
"       \ })
" nnoremap <C-p> :<C-u>Denite buffer file/rec<CR>
" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'default_opts',
"     \ ['-i', '--vimgrep'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
"
"
"

"" COC stuff
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
set clipboard=unnamedplus

let g:coc_node_path = '~/.nvm/versions/node/v16.14.0/bin/node'
