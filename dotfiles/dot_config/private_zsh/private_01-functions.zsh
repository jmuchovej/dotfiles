#!/usr/bin/env zsh

#: ZSH
function zp {
    [ ${1} = "-l" ] && {la ${ZSH}/ && return}
    filename=${1}

    list=$(ls ${ZSH}/ | grep -i ${filename})
    file=$(echo $list | grep -i zsh)

    if [ ! ${file} ]; then
        file=$(echo $list | cut -d$'\n' -f 1)
    fi

    ${EDITOR} ${ZSH}/${file}
    source ${HOME}/.zshrc
}

function plugins {
    case ${1} in
        "setup")
            antibody bundle < ${PLUGINS} > ${PLUGINS}-$(uname)
            ;;
        "load")
            source ${PLUGINS}-$(uname)
            ;;
        "edit")
            ${EDITOR} ${PLUGINS}
            plugins "setup"
            source ${HOME}/.zshrc
            ;;
    esac
}

#: tmux
# function tn {
#     session=${1}
#     if [ ! $(tls | grep -i ${session} -c) ]; then
#         z ${session}
#         tmux a -t ${session}
#     else
#         z ${session}
#         tmux new -s ${session}
#     fi
# }

# function ta {
#     session=${1}
#     tn ${session}
# }

#: Misc
function mktouch {
    # Make a folder, then touch the file
    file=${1}
    mkdir -p $(dirname $file) && touch $file
}

function brew-dump {
    rm $BREWFILE
    brew bundle dump --describe --file=$BREWFILE
}
