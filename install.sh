#!/bin/bash
#

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

./scripts/install_fonts.sh
./scripts/install_themes.sh
