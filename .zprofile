
PATH=.:$PATH

# node nvm coffee
source ~/.nvm/nvm.sh
nvm use v0.6.19

# retreat g as git
alias -g g="git"

# tmux 256-color mode
alias -g tmux="tmux -2"

# emacs use always with --no-window-system
alias -g emacs='TERM=xterm-256color emacs -nw'

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
rvm use 1.9.3
