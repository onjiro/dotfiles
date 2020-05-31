# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
PATH=/usr/local/bin:~/mygo/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export GOPATH=~/mygo

# Use emacs key bind
bindkey -e

# disable stop with c-s
stty stop undef

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chihiro/.zshrc'

autoload -Uz compinit
compinit

# show path at prompt
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

# show path at title
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# use z
. ~/z/z.sh

# history search with C-p, C-n
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# use zsh-completions
fpath=(~/.zsh.d $fpath)

# use vcs info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# colorize
case ${OSTYPE} in
    darwin*)
        alias ls="ls -G"
        alias grep='grep --color=auto'
        ;;
    linux*)
        alias ls="ls --color=auto"
        alias grep='grep --color=auto'
        ;;
esac
case "${TERM}" in
kterm*)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
xterm*|cons25)
    export LSCOLORS=ExCxBxdxFxegedabagacad
    export LS_COLORS='di=01;34:ln=01;32:so=01;31:ex=01;35:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;32;1' 'so=;31;1' 'ex=35;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# tool aliases
alias -g g="git"
alias -g gs="git status"
alias -g gl="git log --pretty=format:'%C(red reverse)%d%Creset%C(white reverse) %h %Creset %C(green reverse) %an %Creset %C(cyan)%ar%Creset%n%C(white bold)%w(80)%s%Creset%n%n%w(80,2,2)%b' --graph --name-status"
alias -g tmux="tmux -2"

# emacs @see http://d.hatena.ne.jp/flada_auxv/20121110/1352527081
alias -g e='emacsclient -nw'
alias -g e.='emacsclient -nw .'

# use anyenv
eval "$(anyenv init -)"

# use bundle
_bundle_exec_rake_get_command_list () {
  bundle exec rake --tasks
}
_bundle_exec_rake () {
  if [ `which bundle` > /dev/null ]; then
    compadd `_bundle_exec_rake_get_command_list`
  fi
}

compdef _bundle_exec_rake "bundle exec rake"

alias -g b="bundle"
alias -g be="bundle exec"

# use peco if available
# @see http://blog.kenjiskywalker.org/blog/2014/06/12/peco/
if which peco > /dev/null; then
  function peco-select-history() {
    local tac
    if which tac > /dev/null; then
      tac="tac"
    else
      tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
      eval $tac | \
      peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
  }
  zle -N peco-select-history
  bindkey '^r' peco-select-history
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# setup flutter
export FLUTTER_HOME=~/programs/flutter
if [ -e $FLUTTER_HOME ]; then
  export PATH="$PATH:$FLUTTER_HOME/bin"
fi
