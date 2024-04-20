#!/bin/bash
#

# file structure check
if [ $(pwd) != "$HOME/dotfiles" ]
then
	echo "Please make sure the repo is installed to your home ($HOME) folder and run the install.sh from inside the dotfiles folder. Goodbye."
	exit 1
fi

# install packages based on architecture
case "$(uname -s)" in
	Linux*)
		echo "Setting up Linux environment..."
		./scripts/install_packages_linux.sh
		;;
	Darwin*)
		echo "Setting up MacOS environment..."
		./scripts/install_packages_macos.sh
		;;
	*)
		echo "Unknown operating system. Goodbye."
		exit 1
		;;
esac

# set up configuration files
stow config

# install fonts
./scripts/install_fonts.sh

# install themes
# (deprecated, since all themes are currently stowed)
#./scripts/install_themes.sh
