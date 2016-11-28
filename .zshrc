#なんかすごいやつ
autoload -U compinit
compinit

#環境変数LANG?まだちゃんとりかいしていない
export LANG=ja_JP.UTF-8
#なんかさいしんのvimをつかえるようにする
export PATH=“/usr/local/bin:$PATH”

#エイリアス
alias ll='ls -la'
alias vi='vim'
alias ls='gls --color=auto'
alias cdde='cd ~/Desktop'

#ターミナルのテーマにひつようなやつ
eval $(gdircolors ~/terminalSettings/solarized/dircolors-solarized-master/dircolors.ansi-universal)
