#すごい
autoload -U compinit
compinit -d ~/.zcompdump

#vim風味
#bindkey -v
#bindkey -M viins 'jj' vi-cmd-mode
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
alias python='python3'
#alias de='cd ~/Desktop'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias deintoml='vim ~/.vim/userautoload/dein/plugins.toml'
alias lazytoml='vim ~/.vim/userautoload/dein/plugins_lazy.toml'
alias ogc='open -a Google\ chrome'
alias osp='open -a System\ Preferences'
alias rlg='exec $SHELL -l'

#hash
setopt CDABLE_VARS
#hash -d desk=~/Desktop
#ディレクトリに名前をつける関数
function name_dir() # dir, name
{
  local dir=$1
  local name=$2

  if [ -d $dir ]; then
    hash -d $name=$dir
    return 0
  else
    return 1
  fi
}

#ビープ音をなくす
setopt nolistbeep
setopt no_beep

#プロンプト
PROMPT='
%F{green} » %f'
RPROMPT=[%~]

#補完強化大文字小文字区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#ヒストリー関連
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
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
#cdしたディレクトリをディレクトリスタックに保存
#`cd + <Tab>`でディレクトリの履歴が表示され、移動できる
setopt auto_pushd
#すでにスタックにあるものは記録しない
setopt pushd_ignore_dups
