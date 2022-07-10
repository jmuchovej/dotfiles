# apps -
#   define aliases and variables for different apps

# xdg
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}
export XDG_PACKAGE_HOME=${XDG_PACKAGE_HOME:-$HOME/.local/opt}

if [[ "$OSTYPE" == darwin* ]]; then
  export XDG_DESKTOP_DIR=${XDG_DESKTOP_DIR:-$HOME/Desktop}
  export XDG_DOCUMENTS_DIR=${XDG_DOCUMENTS_DIR:-$HOME/Documents}
  export XDG_DOWNLOAD_DIR=${XDG_DOWNLOAD_DIR:-$HOME/Downloads}
  export XDG_MUSIC_DIR=${XDG_MUSIC_DIR:-$HOME/Music}
  export XDG_PICTURES_DIR=${XDG_PICTURES_DIR:-$HOME/Pictures}
  export XDG_VIDEOS_DIR=${XDG_VIDEOS_DIR:-$HOME/Videos}
  export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects}
fi

#: homebrew
alias bcu="brew cu"
alias brewup="brew update && brew upgrade"
alias caskup="brew cu -af"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS="${HOMEBREW_CASK_OPTS:---appdir=/Applications}"
export HOMEBREW_PREFIX="${XDG_PACKAGE_HOME}/brew";
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}Cellar";
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}";
export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}";

#: tmux
export ZSH_TMUX_UNICODE=true
# alias tmux="TERM=\"xterm-256color\" command tmux"
alias tmux="TERM=\"screen-256color\" \tmux"

#: jupyter / # ipython
export JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"

#: nodejs
# https://stackoverflow.com/a/52316526/2714651
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node.js/repl_history"

#: docker
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
