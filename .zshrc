#すごい
autoload -U compinit
compinit -d ~/.zcompdump

#vim風味
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
#環境変数LANG
export LANG=ja_JP.UTF-8
#入力したコマンドが存在せず、かつディレクトリ名と一致するなら自動でcd
setopt AUTO_CD
cdpath=(.. ~ ~/src)
#エイリアス
alias ...='cd ../..'
alias ls='gls --color=auto'
alias ll='ls -la'
alias vi='vim'
alias de='cd ~/Desktop'
alias vimrc='vim ~/.vimrc'
alias ogc='open -a Google\ chrome'
alias osp='open -a System\ Preferences'
alias rlg='exec $SHELL -l'
#ビープ音をなくす
setopt nolistbeep
setopt no_beep

#プロンプト
#autoload -Uz colors; colors
#PROMPT="%{$fg[green]%} [%m$] %{${reset_color}%}"
RPROMPT=[%~]
SPROMPT="%F{red}Did you mean?: %R -> %r [nyae]?%f"
#vim風味
function zle-line-init zle-keymap-select {

	VIM_NORMAL="%K{blue}%F{white} N %f%k%F{blue}[%m]$%f"
	VIM_INSERT="%K{green}%F{white} I %f%k%F{green}[%m]\$%f"
	PS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
	PS2=$PS1

#	case $KEYMAP in
#		vicmd)
#		PROMPT="%{$fg[cyan]%}[%m/%{$reset_color%}%{$bg[cyan]%}%{$fg_bold[white]%} N %{$reset_color%}%{$fg[cyan]%}]%#%{$reset_color%} "
#		;;
#		main|viins)
#		PROMPT="%{$fg[green]%}[%m/%{$reset_color%}%{$bg[green]%}%{$fg_bold[white]%} I %{$reset_color%}%{$fg[green]%}]%#%{$reset_color%} "
#		;;
#	esac

	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

#Solarized カラー設定
eval $(gdircolors ~/solarized/dircolors-solarized/dircolors.ansi-dark)

#補完強化大文字小文字区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#ヒストリー関連
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
#同じコマンドは記録しない
setopt hist_ignore_dups
#コマンド履歴ファイルを共有
setopt share_history
#ヒストリ検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
