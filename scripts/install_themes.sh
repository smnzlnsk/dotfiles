#!/bin/bash
#

WORKDIR=/tmp/configuration_smn
CONFIG_BASE=~/.config

mkdir -p $WORKDIR
cd $WORKDIR

# alacritty
#

if command -v alacritty > /dev/null 2>&1
then
	echo "alacritty is installed. Setting up themes..."

	ALACRITTY_CONFIG_DIR=$CONFIG_BASE/alacritty

	mkdir -p $ALACRITTY_CONFIG_DIR/catppuccin
	curl -sLO --output-dir $ALACRITTY_CONFIG_DIR/catppuccin https://github.com/catppuccin/alacritty/raw/main/catppuccin-latte.toml
	curl -sLO --output-dir $ALACRITTY_CONFIG_DIR/catppuccin https://github.com/catppuccin/alacritty/raw/main/catppuccin-frappe.toml
	curl -sLO --output-dir $ALACRITTY_CONFIG_DIR/catppuccin https://github.com/catppuccin/alacritty/raw/main/catppuccin-macchiato.toml
	curl -sLO --output-dir $ALACRITTY_CONFIG_DIR/catppuccin https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
else 
	echo "alacritty not installed."
fi

# xfce4 terminal
if command -v xfce4-terminal > /dev/null 2>&1
then
	echo "xfce4-terminal is installed. Setting up themes..."
	if [ -d "~/.local/share/xfce4/terminal/colorschemes" ] 
	then
		mkdir -p ~/.local/share/xfce4/terminal/colorschemes
		git clone https://github.com/catppuccin/xfce4-terminal
		cp xfce4-terminal/src/* ~/.local/share/xfce4/terminal/colorschemes
		rm -rf xfce4-terminal
	else 
		echo "xfce4-terminal themes are already installed."
	fi
else
	echo "xfce4-terminal is not installed."
fi

if [ -d "~/.oh-my-zsh/custom/themes/powerlevel10k" ]
then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else 
	echo "powerlevel10k is already installed."
fi
