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
	mkdir -p ~/.local/share/xfce4/terminal/colorschemes
	git clone https://github.com/catppuccin/xfce4-terminal
	cp xfce4-terminal/src/* ~/.local/share/xfce4/terminal/colorschemes
	rm -rf xfce4-terminal
else
	echo "xfce4-terminal is not installed."
fi

# bat
if command -v batcat > /dev/null 2>&1
then
	echo "batcat is present. Setting up themes..."
	mkdir -p "$(batcat --config-dir)/themes"
	wget -q -P "$(batcat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
	wget -q -P "$(batcat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
	wget -q -P "$(batcat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
	wget -q -P "$(batcat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
	batcat cache --build
elif command -v bat > /dev/null 2>&1
then
	echo "bat is present. Setting up themes..."
	mkdir -p "$(bat --config-dir)/themes"
	wget -q -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
	wget -q -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
	wget -q -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
	wget -q -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
	bat cache --build
else 
	echo "bat / batcat is not installed."
fi
