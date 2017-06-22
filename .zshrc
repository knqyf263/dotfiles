export LANG=ja_JP.UTF-8 

# emacsモード
bindkey -e

PATH=/usr/local/bin:/usr/local/sbin:$PATH 
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

## alias
alias "ls=ls --color=auto"
alias "ll=ls -alh --color=auto"

# 補完
autoload -U compinit
compinit

#プロンプト
setopt prompt_subst
PROMPT='%{'$'\e[''$[32+$RANDOM % 5]m%}%U%B%m{%n}%b%{'$'\e[''m%}%U%%%u '
RPROMPT='%{'$'\e[''33m%}[%~]%{'$'\e[''m%}'

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

## options
setopt BASH_AUTO_LIST
setopt LIST_AMBIGUOUS
setopt AUTO_PUSHD
setopt CDABLE_VARS

## cd打たなくてもディレクトリ移動
setopt auto_cd 

## グロッビング機能(rm *.c~hoge.cとか )
setopt EXTENDED_GLOB

## history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=16384
SAVEHIST=16384
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

#sudoでも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

#存在しないコマンドを入力したときに、近いコマンドを表示
setopt correct

#リスト表示をつめて表示
setopt list_packed

#エイリアスも補完対象に設定
setopt complete_aliases

# 履歴検索機能のショートカット設定
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# OSによって読み込む設定ファイルを変える
case "${OSTYPE}" in
# Mac(Unix)
darwin*)
# ここに設定
	[ -f ~/dotfiles/.zshrc.osx ] && source ~/dotfiles/.zshrc.osx
	;;
# Linux
linux*)
	# ここに設定
	[ -f ~/dotfiles/.zshrc.linux ] && source ~/dotfiles/.zshrc.linux
	;;
esac

# .zsh.d内を読み込む
ZSHHOME="${HOME}/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

