#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.alias

export DOTBARE_DIR="$HOME/.dotbare"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
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

# keep more history
shopt -s histappend
export HISTFILESIZE=10000
export HISTSIZE=1000

source /home/cark/.config/broot/launcher/bash/br
export PATH=$PATH:/home/cark/.spicetify

# pnpm
export PNPM_HOME="/home/cark/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
