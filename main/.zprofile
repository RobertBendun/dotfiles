#!/bin/zsh

# Add ~/.local/bin
export PATH="$PATH:$HOME/.ghcup/bin:$HOME/.local/share/gem/ruby/3.0.0/bin;$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

export PATH="$PATH:$HOME/repos/vowpal_wabbit/build/vowpalwabbit"

# Default programs
export EDITOR="nvim"

# Home cleanup

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XDG_DESKTOP_DIR="$HOME/desktop"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_DOCUMENTS_DIR="$HOME/docs"

export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

export PGDATA="${XDG_DATA_HOME:-$HOME/.local/share}/postgresql/"

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export _JAVA_AWT_WM_NONREPARENTING=1

# Start X Server if on tty 1
[[ $(fgconsole 2> /dev/null) == 1 ]] && exec startx -- vt1
