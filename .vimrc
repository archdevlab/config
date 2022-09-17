""""" vim-plug

call plug#begin('$HOME/.vim/autoload/')

Plug 'joshdick/onedark.vim'

call plug#end()

""""" end of vim-plug

""""" Begin of Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'dracula/vim'

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

"Launch vim and run :PluginInstall
"To install from command line: vim +PluginInstall +qall

""""" end of Vundle

""""" onedark plugin

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

let g:airline_theme='onedark'
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1

if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Make `Function`s bold in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    " Override the `Statement` foreground color in 256-color mode
    autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
    " Override the `Identifier` background color in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
  augroup END
endif

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

let g:onedark_color_overrides = {
\ "black": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
\}

syntax on
colorscheme onedark

""""" end of onedark plugin

""""" dracula plugin

" syntax on
" set termguicolors
" colorscheme dracula
" highlight Normal ctermbg=NONE
" set visualbell

""""" end of dracula plugin

""""" dt general seting

" set path+=**          " Searches current directory recursively.
" set wildmenu          " Display all matches when tab complete.
" set incsearch                   " Incremental search
" set hidden                      " Needed to keep multiple buffers open
" set t_Co=256                    " Set if term supports 256 colors.
" set clipboard=unnamedplus       " Copy/paste between vim and other programs.
" let g:rehash256 = 1

""""" end of dt general seting

""""" General setting

" Smart indent
set smartindent

" C code autoindent
set cindent

" No auto backups
set nobackup

" No swap file
set noswapfile

" Display line numbers
set number

set ts=8 sts=2 sw=2 et

set encoding=utf-8

""""" end of general setting
