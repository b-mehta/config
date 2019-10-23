set runtimepath+=~/.vim
set packpath+=~/.vim
source ~/.vimrc

let g:python3_host_prog='/Users/bmehta/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog='/Users/bmehta/.pyenv/versions/neovim2/bin/python'
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
