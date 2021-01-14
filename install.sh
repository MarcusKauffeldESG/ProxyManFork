#!/bin/bash

# Working from current directory having proxyman

TARGET_DIR="/opt/proxyman"
CONFIG_DIR="/etc/proxyman"
MAIN=$TARGET_DIR/main.sh
BASHRC="/etc/bash.bashrc"
ZSHRC="/etc/zsh/zshrc"

#TODO Add verification if root


# verify if this is current directory
if [[ -f "main.sh" && -f "shellrc.sh" && -f "dropbox.sh" ]]; then
    :
else
    echo "please cd to the folder containing proxyman"
    exit 1
fi


# Creates the directories and copys the files

mkdir -p $TARGET_DIR
mkdir -p $CONFIG_DIR

cp * $TARGET_DIR
chmod -R a+rwx /etc/proxyman


# Adds the proxyman alias to bashrc and zshrc if not already present

if ! grep -q $MAIN $BASHRC; then
	echo 'alias="$MAIN"' >> $BASHRC
	echo "Added alias to Bashrc"
else
	echo "Alias Already in Bashrc"
	echo "Skipping to add it again"
fi


if ! grep -q $MAIN $ZSHRC; then
  	echo 'alias="$MAIN"' >> $ZSHRC
	echo "Added alias to zshrc"
else
	echo "Alias Already in Zshrc"
        echo "Skipping to add it again"
fi



echo "Installed please refresh your shell to use proxyman"
