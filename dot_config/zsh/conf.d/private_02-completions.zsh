#!/usr/bin/env zsh

zmodload -i zsh/complist

#: enable approx matches for complextion
zstyle ":completion:*" completer _expand _complete _ignored _approximate
#: select completions w/ arrow keys
zstyle ':completion:*' menu select
#: group results by category
zstyle ':completion:*' group-name ''
#: enable approx matches for completion
zstyle ':completion:*' completer _expand _complete _ignored _approximate

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

# https://stackoverflow.com/a/22627273/2714651; all for mid-word completion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

[[ ! $(which fzf) ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null
[[ ! $(which gh) ]] && eval "$(gh completion -s zsh)" 2> /dev/null

autoload -Uz compinit

case $(uname) in
    ("Darwin")
        if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' "${ZSH}/.zcompdump") ]; then
            compinit -u
        else
            compinit -Cu
        fi
        ;;
    # TODO: only works on MacOS - get setup on Linux
    ("Linux") compinit -C ;;
esac
