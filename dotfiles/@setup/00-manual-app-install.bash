#!/usr/bin/env bash
#: Install SpaceVim
echo "- Installing SpaceVim..."
quiet "curl -sLf https://spacevim.org/install.sh | bash"

#: Install alt-Emacs
echo "- Adding Emacs profiles..."
quiet "git clone https://github.com/hlissner/doom-emacs ${APPDIR}/doom-emacs"
quiet "git clone https://github.com/syl20bnr/spacemacs ${APPDIR}/spacemacs"
quiet "git clone https://github.com/plexus/chemacs ${APPDIR}/chemacs"
ln -sf "${APPDIR}/chemacs/.emacs" "${HOME}/.emacs"

echo "- Installing Brew if non-existent..."
[ -d "${APPDIR}/brew" ] || quiet "mkdir ${APPDIR}/brew"

url="https://github.com/homebrew/brew/tarball/master"
[ ! $(command -v brew) ] && curl -L "${url}" | tar xz --strip 1 -C "${APPDIR}/brew"
