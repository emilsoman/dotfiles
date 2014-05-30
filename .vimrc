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
"colors molokai
let g:gruvbox_italic=0
colors gruvbox
" colors zenburn
" colors mustang

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

" let g:Powerline_symbols = 'unicode'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '📌'
let g:airline_symbols.whitespace = '💀'
let g:airline_symbols.readonly = '🔒'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


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
"let g:ctrlp_cmd = 'CtrlPBuffer'

" Cache CtrlP indexes
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" Make CtrlP use ag to list the files.
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Enable backspace in insert mode
set backspace=2

" Syntastic
"==========
let g:syntastic_mode_map = { 'mode': 'passive' }

" Set dictionary
" So you can autocomplete from dictionary using <C-X><C-K>
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

" Use tab for snippet expansion
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" Use up and down for YCM popover nav
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
" Autocomplete using words from comments and strings
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" Remove delay after pressing escape and clearing the visual selection
set timeoutlen=1000 ttimeoutlen=0

" Easier buffer switching
nnoremap <Leader>l :ls<CR>
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

" Kashyap's extra bindings for pairing
imap jk <Esc>
imap kj  <Esc>
nnoremap ; :
