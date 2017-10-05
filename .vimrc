set nocompatible

call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'chriskempson/base16-vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'neovimhaskell/haskell-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sirver/ultisnips'
Plug 'raimondi/delimitmate'
Plug 'shougo/neocomplete.vim'
Plug 'lervag/vimtex'
Plug 'honza/vim-snippets'
call plug#end()

filetype plugin on
" set omnifunc=syntaxcomplete#Complete

set showcmd

set ruler		" show the cursor position all the time

set t_Co=256
set autochdir
set autowrite
set autoread

" some convenient numbering settings
set number

autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber

set expandtab

set noshowmode

syntax on

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set smartindent

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" Enable folding
set foldmethod=indent
set foldlevel=99

" write all temporary files into one directory
set directory=$HOME/.cache/vim/swp/
set backupdir=$HOME/.cache/vim/tmp/

" automatically remove trailing whitespace characters on save
autocmd FileType python,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

set updatetime=250

set wildmode=longest,list,full
set wildmenu " experimental

" autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
" autocmd FileChangedShellPost *
"   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

let base16colorspace=256

let g:airline_theme='base16_bright'
let g:tmux_navigator_save_on_switch = 1

let g:airline#extensions#tabline#enabled = 1

autocmd FileType python match Error /\%81v.\+/

nnoremap ˚ O<Esc>
nnoremap ∆ o<Esc>
noremap! ;; <Esc>

inoremap <silent> <c-h> <Esc>:TmuxNavigateLeft<cr>
inoremap <silent> <c-j> <Esc>:TmuxNavigateDown<cr>
inoremap <silent> <c-k> <Esc>:TmuxNavigateUp<cr>
inoremap <silent> <c-l> <Esc>:TmuxNavigateRight<cr>
inoremap <silent> <c-\> <Esc>:TmuxNavigatePrevious<cr>

colorscheme base16-bright

highlight Normal ctermbg=none
highlight Nontext ctermbg=none
