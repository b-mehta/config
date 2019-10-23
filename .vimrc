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
Plug 'lervag/vimtex'
Plug 'honza/vim-snippets'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'tmux-plugins/vim-tmux'
Plug 'tmhedberg/simpylfold'
Plug 'scrooloose/nerdcommenter'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'junegunn/vim-easy-align'
call plug#end()

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set conceallevel=2
let g:tex_conceal="abdgm"

set showcmd

set ruler		" show the cursor position all the time

set t_Co=256
" set autochdir
set autowrite

" some convenient numbering settings
set number relativenumber

set expandtab

set noshowmode
nnoremap <silent>§ :noh<CR>

syntax on

" indent when moving to the next line while writing code
set smartindent

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=2
autocmd Filetype py setlocal shiftwidth=4

" set tabs to have 4 spaces
set tabstop=2
autocmd Filetype py setlocal tabstop=4

" Enable folding
set foldmethod=indent
set foldlevel=99

" write all temporary files into one directory
set directory=$HOME/.cache/vim/swp/
set backupdir=$HOME/.cache/vim/tmp/

" automatically remove trailing whitespace characters on save
autocmd FileType python,vim,tex,haskell autocmd BufWritePre <buffer> :%s/\s\+$//e

set updatetime=250

set wildmode=longest,list,full

autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

let base16colorspace=256

let g:airline_theme='base16_bright'
let g:tmux_navigator_save_on_switch = 1

let g:airline#extensions#tabline#enabled = 1

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave *.tex mkview
  autocmd BufWinEnter *.tex silent loadview
augroup END

autocmd FileType python match Error /\%81v.\+/

nnoremap <Space> i_<Esc>r
noremap! ;; <Esc>
noremap Y y$

colorscheme base16-bright

highlight Normal ctermbg=none
highlight Nontext ctermbg=none
highlight MatchParen ctermbg=237

" airline fonts
let g:airline_powerline_fonts = 1

set hidden
" vimtex setting
let g:vimtex_view_method = 'skim'
let g:vimtex_view_automatic = 0

" vimtex/neovim
let g:vimtex_compiler_progname='/Users/bmehta/.pyenv/shims/nvr'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

autocmd FileType netrw setl bufhidden=wipe
