""" GEF
""" 2022-07-14

""" From the instructions shown when
""" typing :help nvim-from-vim
""" to import the vim configuration
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.nvimrc


""" From the tutorial at:
""" https://www.youtube.com/watch?v=JWReY93Vl6g
""" And the repository:
""" https://github.com/NeuralNine/config-files/blob/master/init.vim

""""""""""""""""""""""""""""
""" GENERAL SETTINGS

:set number
:set relativenumber
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set expandtab          " Convert tabs into spaces
:set hlsearch           " Highlight all mathces in a search
":set mouse=a           " Enable the use of the mouse in vim
:set scrolloff=8        " Start scrolling 8 characters from the top or bottom of the screen
:set colorcolumn=80     " Show a line at 80 characters
:set nowrap             " Do not wrap lines in the line below
:set signcolumn=yes     " Leave space for icons

:set nomodeline         " Disable using the ex: mode lines
                        " This was causing trouble with some README.md files

""""""""""""""""""""""""""""
""" PLUGINS
""" Using vim-plug
""" https://github.com/junegunn/vim-plug
" Brief help
" :PlugStatus     - lists configured plugins
" :PlugInstall    - installs plugins
" :PlugClean      - confirms removal of unused plugins

call plug#begin()

Plug 'https://github.com/tpope/vim-surround'    " Surrounding ysw)
Plug 'https://github.com/tpope/vim-fugitive'    " Git integration
Plug 'https://github.com/tpope/vim-commentary'    " For Commenting gcc & gc
Plug 'https://github.com/preservim/nerdtree'    " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color'        " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/tc50cal/vim-terminal'    " Vim Terminal
Plug 'https://github.com/preservim/tagbar'        " Tagbar for code navigation
"Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/mg979/vim-visual-multi' " CTRL + N for multiple cursors

Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
" This also required downloading a font from:
" https://github.com/ryanoasis/nerd-fonts/releases/tag/v2.1.0
" Then using this command to reload the fonts:
" fc-cache -fv

" Elixir tools: https://bitboxer.de/2016/11/13/vim-for-elixir/
Plug 'https://github.com/sheerun/vim-polyglot'   " Support for multiple languages
Plug 'https://github.com/ludovicchabant/vim-gutentags'   " Automatic generation of tags
Plug 'https://github.com/neomake/neomake'        " Run tests of the code
" Also needed to follow this instructions to work with CoC:
" https://github.com/elixir-lsp/coc-elixir#server-fails-to-start

" Requires installation of nodejs
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
" Follow the instructions on the video
" Install nodejs and npm using the package manager at:
" https://github.com/nvm-sh/nvm
" Then follow instructions in section 3 of:
" https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04
" When it is time to compile CoC:
" Change to the directory: ~/.local/share/nvim/plugged/coc.nvim/
" And install yarn with:
" sudo env "PATH=$PATH" npm install -g yarn
" When all is installed, add language extensions using:
" :CocInstall coc-python
" Listo of other extensions: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

Plug 'https://github.com/pangloss/vim-javascript'   " JavaScript syntax

Plug 'https://github.com/github/copilot.vim'      " GitHub Copilot
" Then follow the instructions at:
" https://docs.github.com/en/copilot/getting-started-with-github-copilot/getting-started-with-github-copilot-in-neovim
" Run: :Copilot setup
" To select proposed code: Tab
" To select alternatives: Alt + [  / Alt + ]


call plug#end()

set encoding=UTF-8     " Required for the icons

""""""""""""""""""""""""""""
""" MAPPINGS
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>


""""""""""""""""""""""""""""
""" AIR-LINE CONFIGURATION
" Enable the use of symbols
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
     let g:airline_symbols = {}
endif

" unicode symbols
" Only the last one defined is used
" Used some symbols from: https://coolsymbol.com/
let g:airline_left_sep = '▶'
let g:airline_left_sep = '◣'
let g:airline_right_sep = '◀'
let g:airline_right_sep = '◥'
let g:airline_right_alt_sep = '◀'
let g:airline_left_alt_sep = '▶'
let g:airline_symbols.colnr = ' : '
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = ' ㏑ '
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.branch = '⌥'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'



""""""""""""""""""""""
"""""" One dark theme
""""""""""""""""""""""
"" Change colors for the comments and line numbers
"" Documentation at: https://github.com/joshdick/onedark.vim
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:new_numbers = { "gui": "#AF5F00", "cterm": "130", "cterm16" : "3" }
    let s:new_comments = { "gui": "#87FFFF", "cterm": "123", "cterm16" : "6" }
    autocmd ColorScheme * call onedark#set_highlight("LineNr", { "fg": s:new_numbers })
    autocmd ColorScheme * call onedark#set_highlight("Comment", { "fg": s:new_comments })
  augroup END
endif

":colorscheme atom                " Default theme in nvim
:colorscheme onedark            " Default theme in nvim
":colorscheme challenger_deep    " Comments are gray
":colorscheme purify            " Comments are dark blue


"""""""""""""""""""""
""""" GENERATION OF TAGS
"""""""""""""""""""""
let g:gutentags_cache_dir = '~/.tags_cache'


"""""""""""""""""""""
""""" AUTOCOMMANDS
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

" Change position of color line for Elixir files
autocmd FileType elixir set colorcolumn=100
