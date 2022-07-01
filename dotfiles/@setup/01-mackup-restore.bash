#!/usr/bin/env bash

source ${DOTS}/.profile
brew install mackup

echo "- Restore Dotfiles with Mackup..."
ln -sf "${DOTS}/.mackup.cfg" "${HOME}/.mackup.cfg"
ln -sf "${DOTS}/.mackup" "${HOME}/.mackup"

source ${DOTS}/.profile
mackup restore -f
