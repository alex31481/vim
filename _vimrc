set nocompatible              " be iMproved, required
filetype off                  " required


"Set font to consolas 11
set guifont=Consolas:h11
"set guifont=Monaco:h10
set guifont=Inconsolata:h12
"
" set the runtime path to include Vundle and initialize 
" setting to my preferred vim location this location can be custom as you 
" the location to install Vundle
set rtp+=c:/vimfiles/bundle/Vundle.vim
" setting to my preferred vim bundle location this location can be custom as you 
call vundle#begin('c:/vimfiles/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"source from common file between all systems
source c:\vim\main.vimrc
"Setting the background 
highlight normal guibg=#151718
