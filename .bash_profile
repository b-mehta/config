#!/bin/bash

source ~/.config/git-prompt.sh
source ~/.config/git-completion.bash

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

GIT_PS1_SHOWDIRTYSTATE=1
PS1='${PYTHON_VIRTUALENV}\[\e[32m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\]: \w$(__git_ps1 " \[\e[34m\](%s)\[\e[m\]")
\[$(iterm2_prompt_mark)\]\$ '

source ~/.bashrc

export PATH=$PYENV_ROOT/bin:$PATH
[ -x "$(command -v pyenv)" ] && eval "$(pyenv init -)"
[ -x "$(command -v pyenv)" ] && eval "$(pyenv virtualenv-init -)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
