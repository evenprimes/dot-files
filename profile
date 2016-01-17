#!/bin/bash
for file in ~/.{bash_prompt.sh,exports.sh,aliases.sh,functions.sh,dircolors}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
HISTCONTROL=ignoreboth
HISTIGNORE="ls:pwd:man *:history"
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Turn on the extended pattern matching features
shopt -q -s extglob

# Make multi-line commandsline in history
shopt -q -s cmdhist

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Setup virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
