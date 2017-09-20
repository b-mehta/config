#!/bin/bash

source ~/config/git-prompt.sh
source ~/config/git-completion.bash

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
PROMPT_COMMAND=set_virtualenv
PS1='${PYTHON_VIRTUALENV}\[\e[32m\]\u@\h\[\e[m\]:\w$(__git_ps1)\n\$ '

source ~/.bashrc

export PATH=$PYENV_ROOT/bin:$PATH
[ -x "$(command -v pyenv)" ] && eval "$(pyenv init -)"
[ -x "$(command -v pyenv)" ] && eval "$(pyenv virtualenv-init -)"
