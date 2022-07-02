#!/usr/bin/env bash

_brewfile="${DOTS}/@setup/$(uname).Brewfile"
echo "- \`brew bundle\`"

brew bundle
brew bundle install --file="${_brewfile}"
