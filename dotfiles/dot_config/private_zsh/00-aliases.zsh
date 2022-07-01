#!/usr/bin/env zsh

alias v="${VISUAL}"

#: SSH
alias discovery="ssh discovery.ionlights.zt"
alias enterprise="ssh enterprise.ionlights.zt"

alias sshcfg="v ~/.ssh/config"

alias zrc="v ~/.zshrc && source ~/.zshrc"

#: Emacs
alias doom="$HOME/Applications/doom-emacs/bin/doom"

#: ls
[ $(uname) = "Darwin" ] && alias -g ls="gls"
[ $(uname) = "Darwin" ] && alias -g grep="ggrep"

alias ll="ls --color --group-directories-first -lhFv"
alias la="ll -A"
alias lr="ll -r"
alias ld="ll -d */"
alias l="ll"

ignoreRegex=".*\(Permission denied\)"
ignoreRegex="${ignoreRegex}\|\(Operation not permitted\)"
alias size="du -ch -d 1 2> >(grep -v \"${ignoreRegex}\") | sort -h"

#: rm
[ $(command -v trash-put) ] && alias rm="trash-put"
[ $(command -v trash-put) ] && alias rmdir="trash-put"

#: Anaconda
alias ca="conda activate"
alias ce="conda env create -f"
alias cl="conda list"
alias cel="conda env list"

#: tmux
# alias tmux="TERM='xterm-256color' command tmux -u"
# alias trc="v $HOME/.tmux.conf.local"
# alias tls="tmux ls"

alias sudo="sudo -E"
