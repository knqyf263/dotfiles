autoload colors
colors
export LS_COLORS="${LS_COLORS}:di=01;36"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
