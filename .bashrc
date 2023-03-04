#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# start ssh-agent
if ! pgrep -u "$USER" ssh-agent >/dev/null; then
	ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
	source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# set window title
set_window_title() {
	# expanded as prompt string
	win_title="\u@\H \w"
	echo -ne "\033]0;${win_title@P}\a"
}

if [[ "$PROMPT_COMMAND" ]]; then
	export PROMPT_COMMAND="$PROMPT_COMMAND;set_window_title"
else
	export PROMPT_COMMAND="set_window_title"
fi

eval "$(thefuck --alias)"
