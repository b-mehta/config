#!/bin/bash

source ~/.config/git-prompt.sh
source ~/.config/git-completion.bash
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -f $(brew --prefix)/etc/bash_completion  ]; then
    source $(brew --prefix)/etc/bash_completion
fi

function set_virtualenv () {
  if [[ `pyenv version-name` == "system" ]] ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="(`pyenv version-name`) "
  fi
}
function settings () {
    if [[ `pyenv version-name` == "system" ]] ; then
        PYTHON_VIRTUALENV=""
        PY_STAT=""
    else
        PYTHON_VIRTUALENV="(`pyenv version-name`) "
        PY_STAT="py: (`pyenv version-name`)"
    fi

    if [[ "$(__git_ps1)" == "" ]] ; then
        GIT_STAT=""
    else
        GIT_STAT="git:$(__git_ps1) "
    fi
    it2setkeylabel set status "$GIT_STAT $PY_STAT"
}
PROMPT_COMMAND=settings

GIT_PS1_SHOWDIRTYSTATE=1
PS1='\[\e[33m\]${PYTHON_VIRTUALENV}\[\e[m\]\[\e[32m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\]: \w$(__git_ps1 " \[\e[34m\](%s)\[\e[m\]")
\[$(iterm2_prompt_mark)\]\$ '

source ~/.bashrc

export PATH=$PYENV_ROOT/bin:$PATH
[ -x "$(command -v pyenv)" ] && eval "$(pyenv init -)"
[ -x "$(command -v pyenv)" ] && eval "$(pyenv virtualenv-init -)"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export PATH="$HOME/Library/Haskell/bin:$PATH"

# OPAM configuration
. /Users/bmehta/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
