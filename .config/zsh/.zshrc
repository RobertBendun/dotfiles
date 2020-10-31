# Rob Bendun configuration of Zsh

# Enable colors and set prompt
autoload -U colors && colors
setopt PROMPT_SUBST
export PS1='λ%f [%F{magenta}%~%f]$(echo $LastCommandExecutionTime) %F{red}>%F{yellow}>%F{green}>%f '

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

# Show execution time of last command
if ! command -v pptimediff; then
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


