PATH=.:$PATH

# node nvm coffee
source ~/.nvm/nvm.sh
nvm use v0.6.12

# retreat g as git
alias -g g="git"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
rvm use 1.9.3
