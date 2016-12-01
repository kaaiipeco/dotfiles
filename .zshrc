#すごい
autoload -U compinit
compinit

#環境変数LANG
export LANG=ja_JP.UTF-8

#エイリアス
alias ls='gls --color=auto'
alias ll='ls -la'
alias vi='vim'
alias cdde='cd ~/Desktop'

#プロンプト
autoload -Uz colors; colors
PROMPT="%{$fg[green]%} [%m$] %{${reset_color}%}"
RPROMPT=[%~]

#Solarized カラー設定
eval $(gdircolors ~/solarized/dircolors-solarized/dircolors.ansi-dark)
