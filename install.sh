#!/bin/bash
# This script does not download the package to install it.
# This is because I assume wget/curl might not work as proxy hasn't been set.

# Working from current directory having proxyman

TARGET_DIR="/opt/proxyman"
MAIN=$TARGET_DIR/main.sh
BASHRC="/etc/bash.bashrc"
ZSHRC="/etc/zsh/zshrc"


# verify if this is current directory
if [[ -f "main.sh" && -f "shellrc.sh" && -f "dropbox.sh" ]]; then
    :
else
    echo "please cd to the folder containing proxyman"
    exit 1
fi



mkdir -p $TARGET_DIR
cp * $TARGET_DIR
chmod -R a+rwx /etc/proxyman



if ! grep -q $MAIN $BASHRC; then
	echo $MAIN >> $BASHRC
else
	echo "Alias Already in Bashrc"
	echo "Skipping to add it again"
fi



if ! grep -q $MAIN $ZSHRC; then
  echo $MAIN >> $ZSHRC
else
	echo "Alias Already in Zshrc"
        echo "Skipping to add it again"
fi






echo "Installed please refresh your shell to use proxyman"
