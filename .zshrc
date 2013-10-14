# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups

# Use emacs key bind
bindkey -e

# disable stop with c-s
stty stop undef

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chihiro/.zshrc'

autoload -Uz compinit
compinit

setopt auto_cd
setopt auto_pushd

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
alias -g tmux="tmux -2"
alias -g emacs='TERM=xterm-256color emacs -nw'
alias -g vu='vagrant up'
alias -g vs='vagrant ssh'
alias -g vp='vagrant provision'
alias -g vh='vagrant halt'
alias -g vr='vagrant reload'

# use rbenv
if [ -e $HOME/.rbenv/bin ]; then
  export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
  eval "$(rbenv init -)"
fi
