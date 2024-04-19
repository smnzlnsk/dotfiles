#!/bin/bash
#

FONTDIR=/tmp/meslofont
FONTDEST=~/.local/share/fonts
MESLO_VERSION="v3.2.1"

if ! fc-list | grep -q "Meslo"
then

	mkdir -p $FONTDIR
	cd $FONTDIR
	echo -n "Installing Meslo Nerd Font... "
	wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/$MESLO_VERSION/Meslo.zip
	unzip -qq Meslo.zip "*.ttf" -d $FONTDEST
	cd
	rm -rf $FONTDIR
	echo "done"
else 
	echo "Meslo Nerd Font is already installed."
fi
