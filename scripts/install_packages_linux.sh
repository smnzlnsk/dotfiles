#!/bin/bash
#

FZF_VERSION="0.50.0"
GIT_DELTA_VERSION="0.17.0"

# packages
sudo apt install vim git curl wget bat tmux

# tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.config/tmux/tmux.conf

# fzf
wget -q https://github.com/junegunn/fzf/releases/download/$FZF_VERSION/fzf-$FZF_VERSION-linux_amd64.tar.gz
tar -xvf fzf-$FZF_VERSION-linux_amd64.tar.gz
sudo mv fzf /usr/bin/
rm fzf-*-linux_amd64.tar.gz

# git-delta
wget -q https://github.com/dandavison/delta/releases/download/$GIT_DELTA_VERSION/git-delta_${GIT_DELTA_VERSION}_amd64.deb
sudo dpkg -i git-delta_${GIT_DELTA_VERSION}_amd64.deb
rm git-delta_${GIT_DELTA_VERSION}_amd64.deb

