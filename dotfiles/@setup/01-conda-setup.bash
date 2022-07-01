#!/usr/bin/env bash

# Updating to install MiniForge, instead of Miniconda
echo "- Installing MiniForge..."
brew install miniforge

#: Setting up Miniconda
echo "- Installing Miniconda..."
OS=$([ $(uname) = "Darwin" ] && echo "MacOSX" || echo "Linux")

if [ ! -d "${APPDIR}/miniconda" ]; then
    url="https://repo.anaconda.com/miniconda/Miniconda3-latest-${OS}-x86_64.sh"
    quiet "curl -fsSL -o ${HOME}/miniconda.sh ${url}"
    chmod +x "${HOME}/miniconda.sh"
    bash ${HOME}/miniconda.sh -b -p ${APPDIR}/miniconda
    rm "${HOME}/miniconda.sh"
fi

echo "- Update conda \`base\` environment..."
source ${DOTS}/.profile
quiet "conda env update -n base -f ${DOTS}/@setup/env.yml"
