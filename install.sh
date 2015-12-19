#!/usr/bin/env bash

########## Variables

dir=$(pwd)                     # dotfiles directory
files="aliases.sh bash_prompt.sh dircolors exports.sh functions.sh git-prompt git-completion.bash gitconfig gitignore_global profile vimrc"

##########

# move any existing dotfiles in homedir to dotfiles_old directory, then
# create symlinks from the homedir to any files in the ~/dotfiles
# directory specified in $files
for file in $files; do
	sourceFile=$dir/$file
	destFile=~/.$file

	# echo $sourceFile
	# echo $destFile
	if [ ! -L $destFile ]; then
		echo "Creating symlink to $file in home directory."
		ln -sv $sourceFile $destFile
	fi
done

