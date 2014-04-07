" Forget being compatible with good ol' vi
set nocompatible

set encoding=utf-8 " Necessary to show Unicode glyphs

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode
set t_Co=256
" Do not wrap text
set nowrap
" Show line numbers
set number
" Highlight searches
set hls
" Ignore case
set ic
set smartcase
" Incremental search
set incsearch
" set smartindent
set autoindent smartindent
set tabstop=2
set shiftwidth=2
set expandtab
"Always show current position
set ruler

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set laststatus=2
set statusline=%f "tail of the filename

"Goodbye pathogen
"call pathogen#infect()
"call pathogen#helptags()

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Display unprintable characters
set list!
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«

if $TERM =~ '256color'
  set t_Co=256
elseif $TERM =~ '^xterm$'
  set t_Co=256
endif

" In diff mode, ignore whitespace changes and align unchanged lines
set diffopt=filler,iwhite

set noerrorbells                " Disable error bells
" Undo
set undolevels=10000
if has("persistent_undo")
  set undodir=~/.vim/undo      " Allow undoes to persist even after a file is closed
  set undofile
endif

" Colors
set background=dark
colors molokai
" colors zenburn
" colors solarized

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
"Ctags should list all matching tags
noremap <C-]> g<C-]>

"Set Leader key to comma
let mapleader = ","

"Use global temp directory
set directory=~/.vim/tmp

"custom commands
"
command Sudow w !sudo tee %

"""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""
"nnoremap <C-g> :NERDTreeToggle<cr>
"let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
"let NERDTreeHighlightCursorline=1
"let NERDTreeShowBookmarks=1
"let NERDTreeShowFiles=1

"Shortcut for running Rspec for current file : ,R
"and the example under current line: ,r
function! RSpecFile()
  execute("!clear && bundle exec rspec " . expand("%p"))
endfunction
map <leader>R :call RSpecFile() <CR>
command! RSpecFile call RSpecFile()

function! RSpecCurrent()
  execute("!clear && bundle exec rspec " . expand("%p") . ":" . line("."))
endfunction
map <leader>r :call RSpecCurrent() <CR>
command! RSpecCurrent call RSpecCurrent()

"Shortcut for running Zeus Rspec for current file : ,Z
"and the example under current line: ,z
function! ZeusRSpecFile()
  execute("!clear && zeus rspec " . expand("%p"))
endfunction
map <leader>Z :call ZeusRSpecFile() <CR>
command! ZeusRSpecFile call ZeusRSpecFile()

function! ZeusRSpecCurrent()
  execute("!clear && zeus rspec " . expand("%p") . ":" . line("."))
endfunction
map <leader>z :call ZeusRSpecCurrent() <CR>
command! ZeusRSpecCurrent call ZeusRSpecCurrent()

"Shortcut for running Cucumber for current file : ,C
"and the example under current line: ,c
function! CucumberFile()
  execute("!clear && bundle exec cucumber " . expand("%p"))
endfunction
map <leader>C :call CucumberFile() <CR>
command! CucumberFile call CucumberFile()

function! CucumberCurrent()
  execute("!clear && bundle exec cucumber " . expand("%p") . ":" . line("."))
endfunction
map <leader>c :call CucumberCurrent() <CR>
command! CucumberCurrent call CucumberCurrent()

" Toggle paste mode while in insert mode with F12
set pastetoggle=<F3>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Duplicate visual block
vmap <leader>d y'>p

" Powerline fancy symbols
" let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'

"Common abbreviations
abbr dbg require 'debugger'; debugger
abbr pryy require 'pry'; binding.pry
abbr sph require 'spec_helper'

"Cucumber regex abbrs
abbr mq "([^"]*)"
abbr st /^ "([^"]*)"  $/

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"Draw a dark grey ruler at 80 chars
set colorcolumn=80
highlight ColorColumn ctermbg=234

" Show line cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Ctrl-P for only buffer
let g:ctrlp_cmd = 'CtrlPBuffer'

" Enable backspace in insert mode
set backspace=2
