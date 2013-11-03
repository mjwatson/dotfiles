" ****************** Intro *******************

set nocompatible
filetype off

" *********** Vim package management **********

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

execute pathogen#infect()

" Let vundle manage vundle updates
Bundle 'gmarik/vundle'

" ***********   Basics   **********************

Bundle 'tpope/vim-sensible'

syntax on
filetype plugin indent on

" Allow switching buffers without saving
set hidden

let mapleader = ","

" Tab completion do the same as the shell
set wildmenu
set wildmode=list:longest

" Have search ignore case intelligently
set ignorecase
set smartcase

" Add a title
set title

" Quickly get out of insert mode
inoremap jk <Esc>
inoremap <ctrl-c> <Esc>

" *********** Whitespace **********************

set tabstop=4
set expandtab
set shiftwidth=4

" *********** Appearance **********************

Bundle 'Zenburn'
Bundle 'altercation/vim-colors-solarized'

" My preference
set t_Co=256
set term=screen-256color
colorscheme zenburn

" For when I want to use solarized
let g:solarized_termcolors=256

" General terminal redirect 
let g:slime_target = "tmux"

" *********** Useful install ******************

" Better history / undo / redo
Bundle "Gundo"
nnoremap <F3> :GundoToggle<CR>

" Insert snippets ala textmate.
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" Pretty powerline
Bundle "Lokaltog/powerline"
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Syntax checking
Bundle "scrooloose/syntastic"
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1

" Comments
Bundle "tComment"

" Tags
Bundle "majutsushi/tagbar"
nnoremap <F12> :TagbarToggle<CR>

" Improve repeat (ie .) for other plugins
Bundle "tpope/vim-repeat"

" *********** Source control ******************

Bundle 'tpope/vim-fugitive'

" *********** Move around a file ******************

" Fast moving around documents
Bundle 'Lokaltog/vim-easymotion'

" A bunch of shortcuts
Bundle 'tpope/vim-unimpaired'

" Managing surrounding brackets etc
Bundle 'tpope/vim-surround'

" *********** File searching etc ******************

" Manage buffers better
Bundle "bufexplorer.zip"

" Search files under the current directory
Bundle 'git://git.wincent.com/command-t.git'

" very nice file browser
Bundle 'scrooloose/nerdtree'
map <F5> :NERDTreeToggle<CR>

" Fuzzy finding
Bundle 'L9'
Bundle 'FuzzyFinder'

" full path fuzzy search
Bundle 'kien/ctrlp.vim'
map <leader>d :CtrlP<CR> 
map <ctrl-p> :CtrlP
nnoremap <leader>f :CtrlPTag<cr>

Bundle "tacahiroy/ctrlp-funky"
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fd :CtrlPFunky<Cr>
nnoremap <Leader>df :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" *********** Basic file type support ******************

" some markdown support
Bundle 'https://github.com/plasticboy/vim-markdown.git'

" some yaml support
Bundle 'https://github.com/avakhov/vim-yaml.git'

" formatting for js
Bundle "pangloss/vim-javascript"

" HTML
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" *********** Assorted useful hacks *******************

" Will allow you to use :w!! to write to a file using sudo if you forgot to sudo
" vim file (it will prompt for sudo password when writing)
" http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null %

" Reload changes to .vimrc automatically
autocmd BufWritePost ~/.vimrc source ~/.vimrc

" Starting from vim 7.3 undo can be persisted across sessions
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" Return to last edit position when opening files
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \ exe "normal! g`\"" |
   \ endif

" Remember info about open buffers on close
set viminfo^=%

" *********** Clojure *************************

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ************ C++ *****************************

" Switch between .h and .cpp etc with :A
" <leader>ih switches to file under cursor etc
Bundle "a.vim"
nnoremap <F4> :A<CR>

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

