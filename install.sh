#!/bin/sh
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                     # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
configolddir=~/dotfiles_old/.config
configdir=~/dotfiles/.config
targetconfigdir=~/.config
files="bashrc zshrc zlogin zlogout zpreztorc zprofile zshenv"    # list of files/folders to symlink in homedir
configfiles="starship.toml zellij/config.kdl nushell/config.nu"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
mkdir -p $configolddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving existing dotfile from ~/.$file to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Add in .config files
for file in $configfiles; do
	echo "Moving existing target config file from ~/.config/$file to $configolddir"
	mkdir -p `dirname $configolddir/$file`
	mv $targetconfigdir/$file $configolddir/$file
	echo "Creating symlink to $file in home directory."
	ln -s $configdir/$file $targetconfigdir/$file
done
