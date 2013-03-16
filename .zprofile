
PATH=.:$PATH

# node nvm coffee
if [ -e ~/.nvm/nvm.sh ]; then
  source ~/.nvm/nvm.sh
  nvm use v0.8.11
fi

# retreat g as git
alias -g g="git"

# tmux 256-color mode
alias -g tmux="tmux -2"

# emacs use always with --no-window-system
alias -g emacs='TERM=xterm-256color emacs -nw'

# rvm
if [ -e $HOME/.rvm ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
  rvm use 1.9.3
fi
