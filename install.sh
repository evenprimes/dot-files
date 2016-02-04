#!/usr/local/bin/bash
readonly PROGNAME=$(basename "$0")
readonly ARGS=( "$@" )

# import my utility functions
. ~/.bashlib.sh

main() {
	########## Variables

	readonly local dir=$(pwd)                     # dotfiles directory
	readonly local files="aliases.sh bash_prompt.sh dircolors exports.sh functions.sh gitconfig gitignore_global profile vimrc bashlib.sh"
	local i=
	local sourceFile=
	local destFile=

	##########
	# Update dircolors
	print_status "Updating dircolors"
	gdircolors --bourne-shell dircolors.moonshine > dircolors

	# move any existing dotfiles in homedir to dotfiles_old directory, then
	# create symlinks from the homedir to any files in the ~/dotfiles
	# directory specified in $files
	print_status "Updating dot files"
	for i in $files; do
		sourceFile=$dir/$i
		destFile=~/.$i

		if [ ! -L $destFile ]; then
			print_step "Creating symlink to $i in home directory."
			ln -sv $sourceFile $destFile
		fi
	done

}

main
