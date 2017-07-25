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
