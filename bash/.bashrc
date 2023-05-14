# XDG Directories enforcement
export XDG_CACHE_HOME="$HOME/.cache/"
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GHCUP_USE_XDG_DIRS=true
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
export GOPATH="$XDG_DATA_HOME"/go
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export W3M_DIR="$XDG_STATE_HOME/w3m"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# System settings
export PATH="$PATH:$HOME/.local/bin/"
export LANG="en_US.UTF-8"

# TODO: This may be not a best solution, since gettext can support priority lists or something
# Needs to research this further: https://www.gnu.org/software/gettext/manual/gettext.html#Locale-Environment-Variables
export LANGUAGE="en_US"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\W\$ '
export EDITOR=nvim
export TERMINAL=konsole
export BROWSER=firefox

source "$HOME/.config/aliases"

# Make history infinite
export HISTFILE="${XDG_STATE_HOME}"/bash/history
HISTSIZE=
HISTFILESIZE=

if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
fi
