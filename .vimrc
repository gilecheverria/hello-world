""" GEF .vimrc
""" 2021-05-05


"""""""""""""""""""""
""""" Vundle installation
"""""""""""""""""""""
" https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'     " Git integration in vim
Plugin 'ycm-core/YouCompleteMe' " Autocompletion and refactoring
Plugin 'itchyny/lightline.vim'  " Status line

" Colorschemes : https://vimcolorschemes.com/
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/sonokai'
Plugin 'joshdick/onedark.vim'
Plugin 'altercation/vim-colors-solarized'

" Elixir tools: https://bitboxer.de/2016/11/13/vim-for-elixir/
Plugin 'sheerun/vim-polyglot'   " Support for multiple languages
Plugin 'ludovicchabant/vim-gutentags'   " Automatic generation of tags
Plugin 'neomake/neomake'        " Run tests of the code

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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



"""""""""""""""""""""
""""" One dark theme
"""""""""""""""""""""
" Change colors for the comments and line numbers
" Documentation at: https://github.com/joshdick/onedark.vim
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:new_numbers = { "gui": "#AF5F00", "cterm": "130", "cterm16" : "3" }
    let s:new_comments = { "gui": "#87FFFF", "cterm": "123", "cterm16" : "6" }
    autocmd ColorScheme * call onedark#set_highlight("LineNr", { "fg": s:new_numbers })
    autocmd ColorScheme * call onedark#set_highlight("Comment", { "fg": s:new_comments })
  augroup END
endif


"""""""""""""""""""""
""""" You Complete Me
"""""""""""""""""""""

" Disable the confirmation dialogue for configuration files
" https://github.com/ycm-core/YouCompleteMe#the-gycm_confirm_extra_conf-option
let g:ycm_extra_conf_globlist = ['~/Programming/*','!~/*']

" Automatically close the top window
" https://github.com/ycm-core/YouCompleteMe#the-gycm_autoclose_preview_window_after_completion-option
let g:ycm_autoclose_preview_window_after_completion = 1

" WIP : Trying to get vim to use syntax check in Racket
let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'racket',
  \     'cmdline': [ '/usr/bin/racket' ],
  \     'filetypes': [ 'rkt' ]
  \   }
  \ ]


"""""""""""""""""""""
""""" GENERATION OF TAGS
"""""""""""""""""""""
let g:gutentags_cache_dir = '~/.tags_cache'

"""""""""""""""""""""
""""" GENERAL OPTIONS
"""""""""""""""""""""

" Taken from: https://nvie.com/posts/how-i-boosted-my-vim/
set tabstop=4 softtabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set expandtab
set smartindent
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'

set relativenumber
set nu              " Show the current line number
"set number         " always show line numbers

set nowrap          " don't wrap lines
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
"set copyindent     " copy the previous indentation on autoindenting
set showmatch       " set show matching parenthesis

set hlsearch        " highlight search terms
set incsearch       " show search matches as you type

set scrolloff=8     " Start scrolling when 8 characters from the edge of the screen

set colorcolumn=80  " Show a line at 80 characters

set signcolumn=yes  " Leave permanent space for error messages (with YCM)

color onedark     " Change the color scheme


"""""""""""""""""""""
""""" Lightline
"""""""""""""""""""""
" Documentation : https://github.com/itchyny/lightline.vim
" Show the current status
set laststatus=2
" Hide default status indicator
set noshowmode
" Use the onedark theme
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }


"""""""""""""""""""""
""""" Autocommands
"""""""""""""""""""""

" Function to clear trailing whitespace from lines
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup GEF_GROUP
    " Clear the event listeners
    autocmd!
    " Declare event listeners
    autocmd BufWritePre * : call TrimWhiteSpace()
    autocmd! BufWritePost * Neomake
augroup END
