" Highlight the items found in a search
set hlsearch

" Enable auto indentation
set autoindent
set cindent

" Set the default size for a Tab
set tabstop=4
" Set the size of the indentation performed in vim (with << or >>)
set shiftwidth=4
" Change the tabs to spaces
set expandtab

" Stop Python from sending (#) comments to the left
filetype indent on

" Pathogen installation instructions
" From: https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Instructions to install vim-elixir: 
" https://github.com/elixir-editors/vim-elixir

" YouCompleteMe
" Installation instructions: 
" https://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
" Documentation:
" https://github.com/ycm-core/YouCompleteMe#user-guide
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf_gef.py"
let g:ycm_confirm_extra_conf = 1                            " default: 1
let g:ycm_autoclose_preview_window_after_completion = 0     " default: 0
