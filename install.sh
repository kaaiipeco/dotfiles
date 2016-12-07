#!/bin/sh
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    echo "$f"
	ln -sf ~/dotfiles/"$f" ~/"$f"
done
#ln -sf ~/dotfiles/.vimrc ~/.vimrc
#ln -sf ~/dotfiles/.zshrc ~/.zshrc
#ln -sf ~/dotfiles/.zsh_history ~/.zsh_history
#ln -sf ~/dotfiles/.zcompdump ~/.zcompdump
#ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
#ln -sf ~/dotfiles/colors ~/.vim
#ln -sf ~/dotfiles/doc  ~/.vim
#ln -sf ~/dotfiles/syntax  ~/.vim
