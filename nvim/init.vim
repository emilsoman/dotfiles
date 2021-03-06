" Change some default Vim configs
" ===============================

set encoding=utf-8 " Necessary to show Unicode glyphs

" Enable Filetype magic
filetype on
filetype plugin on
filetype indent on

let mapleader = ","         " Set Leader key to comma
syntax on                   " Turn on syntax highlighting
set hidden                  " Allow swapping buffers by just hiding them
set lazyredraw              " Don't update the display while executing macros
set showmode                " Show current mode
set nowrap                  " Do not wrap text
set number                  " Show line numbers
set relativenumber          " Show relative line numbers
set hls                     " Highlight searches
set ic                      " Ignore case
set smartcase               " Use case when searching with cases
set incsearch               " Incremental search
set autoindent smartindent  " set smartindent
set ruler                   " Always show current position
set autoread                " Autoread when a file is changed from the outside
set wildmenu                " Turn on the WiLd menu
set wildignore=*.o,*~,*.pyc " Ignore compiled files
set laststatus=2            " Always show status line
set diffopt=filler,iwhite   " In diff mode, ignore whitespace changes
set directory=~/.config/nvim/tmp    " Use global swap directory
set pastetoggle=<F3>        " Toggle paste mode while in insert mode with F12
set backspace=2             " Enable backspace in insert mode
set shell=/bin/bash         " Can do with bash shell for vim
set synmaxcol=300           " Don't syn-highlight characters after 300 columns
set nojoinspaces            " Use only 1 space after "." when joining lines
set mouse=                  " Disable mouse

" Use 2 spaces for tab
set tabstop=2
set shiftwidth=2
set expandtab

" Show symbols for tabs and trailing whitespace
set list!
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«

" Set dictionary
" So you can autocomplete from dictionary using <C-X><C-K>
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

"Draw a dark grey ruler at 80 chars
set colorcolumn=80
highlight ColorColumn ctermbg=234

" Show line cursor in insert mode
" and block cursor in normal mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" MOAR undo which persists
set undolevels=10000
if has("persistent_undo")
  set undodir=~/.config/nvim/undo " Allow undos to persist even after a file is closed
  set undofile
endif

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Remove delay after pressing escape and clearing the visual selection
set timeoutlen=1000 ttimeoutlen=0

" Turn on spellcheck in markdown files
autocmd BufRead,BufNewFile *.md setlocal spell


" Load plugins
" ============
if filereadable(expand("~/.config/nvim/vimrc.plugins"))
  source ~/.config/nvim/vimrc.plugins
endif

" Plugin config overrides
" =======================
if filereadable(expand("~/.config/nvim/vimrc.plugin_overrides"))
  source ~/.config/nvim/vimrc.plugin_overrides
endif

" Colors
" ======
set background=dark
let g:gruvbox_italic=0
colors gruvbox
"colors zenburn
"colors mustang
"colors molokai

" Some helper functions
" =====================
if filereadable(expand("~/.config/nvim/vimrc.my_functions"))
  source ~/.config/nvim/vimrc.my_functions
endif

" Custom maps and abbreviations
" =============================

" Save 3 days every 10 years
nnoremap <C-s> <Esc>:update<CR>
inoremap <C-s> <c-o>:update<CR>
nnoremap <Leader>q <Esc>:q<CR>

" Allow saving of files as sudo when I forget to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"Ctags should list all matching tags
noremap <C-]> g<C-]>

" Switch between the last two buffers
nnoremap <leader><leader> <c-^>

" Duplicate visual block
vnoremap <leader>d y'>p

" Easier buffer switching
nnoremap <Leader>l :ls<CR>:b
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>

" Shows cursor line and column
command TalkModeToggle  :call TalkModeToggle()

" Copy/Paste to/from clipboard
vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Toggle search highlights
nnoremap <Leader>/ :set hls!<CR>

" Tabularize shortcut
vnoremap <Leader>t :Tabularize /

" Fuzzy search all open buffers
" using C-/. Yes, C-/ !!!
nmap <unique> <c-_> :CtrlPLine<CR>

" Indent current block
nmap <unique> <leader>a ma=ip`a

" Quick 2 character search using easymotion
map s <Plug>(easymotion-s)
map s <Plug>(easymotion-s2)
map g/ <Plug>(easymotion-sn)

" Incremental search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Use tab to jump to closing/opening matches
"nnoremap <tab> %

" Jump to end or beginning in insert mode
inoremap <C-Right> <esc>A
inoremap <C-Left> <esc>I

" Abbreviations
iabbr sph require 'spec_helper'
iabbr rah require 'rails_helper'
iabbr ppp fprintf(stderr, "------%s:%d----\n", __FILE__, __LINE__);

" Disable ( and ) since I don't use them
" ======================================
nmap ( <Nop>
nmap ) <Nop>

" ESC key comes out of terminal mode when in terminal
tnoremap <Esc> <C-\><C-n>

"set rtp+=$HOME/OpenSource/open-github-commit.vim
