alias ll='ls -l'
alias lm='ls -AFGhl'

BASE16_SHELL=$HOME/.base16-manager/chriskempson/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

set -o vi

export CLICOLOR_FORCE=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
