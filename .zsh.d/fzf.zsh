# Setup fzf
# ---------
if [[ ! "$PATH" == */home/teppei/.fzf/bin* ]]; then
  export PATH="$PATH:/home/teppei/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/teppei/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/teppei/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# integrate all source code with ghq
function fzf-src() {
	local selected_dir=$(ghq list | fzf --query "$LBUFFER" --prompt "[ghq list]")
	if [ -n "$selected_dir" ]; then
		full_dir="${GOPATH}/src/${selected_dir}"

		BUFFER="cd ${full_dir}"
		zle accept-line
	fi
	zle redisplay
}
zle -N fzf-src
stty -ixon
bindkey '^s' fzf-src
