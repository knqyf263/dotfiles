export LANG=ja_JP.UTF-8 

bindkey -e

PATH=/usr/local/bin:/usr/local/sbin:$PATH 
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
PATH=$HOME/bin:$HOME/Documents/workspace/android-sdk-macosx/tools:$HOME/Documents/workspace/android-sdk-macosx/platform-tools:$PATH
# Maven用
PATH=/Applications/eclipse/apache-maven/bin:$PATH
# All commands have been installed with the prefix 'g'
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export JAVA_HOME=`/usr/libexec/java_home`
export HADOOP_INSTALL=/usr/local/Cellar/hadoop/2.4.0
export HADOOP_HOME=$HADOOP_INSTALL
export YARN_HOME=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME/libexec/etc/hadoop
export YARN_CONF_DIR=$HADOOP_HOME/libexec/etc/hadoop
export MAHOUT_HOME=/Users/teppei/Documents/workspace/mahout
# Mahout用
PATH=$MAHOUT_HOME/bin:$PATH

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
export PATH=$JAVA_HOME/bin:$PATH
export HADOOP_HOME=/usr/local/Cellar/hadoop/2.4.0
export HADOOP_CONF_DIR=/usr/local/Cellar/hadoop/2.4.0/libexec/etc/hadoop
export PATH=$HADOOP_CONF_DIR:$HADOOP_HOME/bin:$PATH
export MAHOUT_HOME=/Users/tetufuku94/Documents/workspace/mahout-distribution-0.9

## alias
#alias "ls=gls -G -F --color=auto"
alias "ll=ls -alh"
alias -g L='| less'

autoload -U compinit
compinit

#プロンプト
setopt prompt_subst
PROMPT='%{'$'\e[''$[32+$RANDOM % 5]m%}%U%B%m{%n}%b%{'$'\e[''m%}%U%%%u '
RPROMPT='%{'$'\e[''33m%}[%~]%{'$'\e[''m%}'

## tmux用プロンプト
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

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

## 履歴検索機能のショートカット設定
## 編集はカーソルで、履歴はPNで行う
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## カラー表示と文字コード対策
alias lv="lv -Osjis"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
export LSCOLORS=gxfxcxdxbxegedabagacad

## OSによって読み込む設定ファイルを変える
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
