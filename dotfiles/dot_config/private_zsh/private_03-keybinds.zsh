#!/usr/bin/env zsh

bindkey "[D" backward-word
bindkey "[C" forward-word

bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#: delete-key ~ https://blogsourcepilif.me/2004/10/21/delete-key-in-zsh/
