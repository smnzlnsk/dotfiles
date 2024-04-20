#!/bin/bash
#

FZF_VERSION="0.50.0"
GIT_DELTA_VERSION="0.17.0"

# packages
sudo apt install zsh vim git curl wget bat tmux stow 

# tmux tpm
if [ -d "~/tmux/plugins/tpm" ]
then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source ~/.config/tmux/tmux.conf
else 
	echo "tmux package manager is already installed."
fi

# fzf
if ! command -v "fzf" > /dev/null 2>&1
then
	wget -q https://github.com/junegunn/fzf/releases/download/$FZF_VERSION/fzf-$FZF_VERSION-linux_amd64.tar.gz
	tar -xvf fzf-$FZF_VERSION-linux_amd64.tar.gz
	sudo mv fzf /usr/bin/
	rm fzf-*-linux_amd64.tar.gz
else
	echo "fzf is already installed."
fi

# git-delta
if ! command -v "delta" > /dev/null 2>&1
then
	wget -q https://github.com/dandavison/delta/releases/download/$GIT_DELTA_VERSION/git-delta_${GIT_DELTA_VERSION}_amd64.deb
	sudo dpkg -i git-delta_${GIT_DELTA_VERSION}_amd64.deb
	rm git-delta_${GIT_DELTA_VERSION}_amd64.deb
else 
	echo "git-delta is already installed."
fi
