#!/usr/local/bin/bash

main() {
	########## Variables

	readonly local dir=$(pwd)                     # dotfiles directory
	readonly local files="aliases.sh bash_prompt.sh dircolors exports.sh functions.sh gitconfig gitignore_global profile vimrc"
	local i=
	local sourceFile=
	local destFile=

	##########
	# Update dircolors
	echo Updating dircolors...
	gdircolors --bourne-shell dircolors.moonshine > dircolors

	# move any existing dotfiles in homedir to dotfiles_old directory, then
	# create symlinks from the homedir to any files in the ~/dotfiles
	# directory specified in $files
	echo Updating dot files...
	for i in $files; do
		sourceFile=$dir/$i
		destFile=~/.$i

		if [ ! -L $destFile ]; then
			echo "Creating symlink to $i in home directory."
			ln -sv $sourceFile $destFile
		fi
	done

}

main
