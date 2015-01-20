set nocompatible              " be iMproved, required
filetype off                  " required

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