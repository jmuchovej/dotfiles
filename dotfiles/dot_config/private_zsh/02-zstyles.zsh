#!/usr/bin/env zsh

zstyle :omz:plugins:ssh-agent agent-forwarding on

# keys=("homelabs" "personal" "research")
# identities=()
# for key in $keys; do
#     key="john+${key}@muchovej.com.pem"
#     [ -f ${HOME}/.ssh/${key} ] && identities+=($key)
# done
# 
# zstyle :omz:plugins:ssh-agent identities ${identities}
