#!/usr/bin/env zsh

[ $(uname) = "Darwin" ] || exit

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

#: command-not-found, explicitly on MacOS
source "$(brew --prefix)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
