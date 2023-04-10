# XDG Directories enforcement
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
export GOPATH="$XDG_DATA_HOME"/go
export W3M_DIR="$XDG_STATE_HOME/w3m"
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GHCUP_USE_XDG_DIRS=true
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
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
HISTSIZE=
HISTFILESIZE=

if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
fi
