# Rob Bendun configuration of Zsh

# Enable colors and set prompt
autoload -U colors && colors
setopt PROMPT_SUBST
export PS1='λ%f [%F{magenta}%1~%f]$(echo $LastCommandExecutionTime) %F{red}>%F{yellow}>%F{green}>%f '

# Automatically cd into typed directory
setopt autocd

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/zsh/history


# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files


# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Show execution time of last command
if ! command -v pptimediff > /dev/null; then
	echo Compiling pptimediff. This should not happened!!!
	cc $HOME/.config/pptimediff.c -o $HOME/.local/bin/pptimediff
fi

command-start-hook() {
	export CommandStartedAt=$(date +%s)
}

command-end-hook() {
	if [ -n $CommandStartedAt ]; then
		LastCommandExecutionTime=$(pptimediff $(date +%s) $CommandStartedAt)
		export CommandStartedAt=
	fi
}

# Add aliases
[ -f $HOME/.config/aliases ] && source $HOME/.config/aliases

# Syntax highlightning
source $HOME/downloads/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

add-zsh-hook preexec command-start-hook
add-zsh-hook precmd command-end-hook
