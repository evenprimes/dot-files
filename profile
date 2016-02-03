#!/bin/bash
for file in ~/.{bash_prompt.sh,exports.sh,aliases.sh,functions.sh,dircolors}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
HISTCONTROL=ignoreboth
HISTIGNORE="ls:pwd:man *:history"
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Turn on the extended pattern matching features
shopt -q -s extglob

# Make multi-line commandsline in history
shopt -q -s cmdhist

# If set, a command name that is the name of a directory is executed as if it
# were the argument to the cd command. This option is only used by interactive
# shells.
shopt -s autocd

# If set, Bash replaces directory names with the results of word expansion when
# performing filename completion. This changes the contents of the readline
# editing buffer. If not set, Bash attempts to preserve what the user typed.
shopt -s direxpand

# If set, Bash attempts spelling correction on directory names during word
# completion if the directory name initially supplied does not exist.
shopt -s dirspell

# If set, the pattern ‘**’ used in a filename expansion context will match all
# files and zero or more directories and subdirectories. If the pattern is
# followed by a ‘/’, only directories and subdirectories match.
shopt -s globstar

# If set, shell error messages are written in the standard GNU error message
# format.
shopt -s gnu_errfmt

# If set, Bash allows filename patterns which match no files to expand to a null
# string, rather than themselves.
shopt -s nullglob

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Setup virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
