# make sublime text the default editor
export EDITOR='subl -n -w'
export VISUAL='subl -n -w'

# use most as the pager
export PAGER="most"

# Python virtualenv stuff
export WORKON_HOME=~/Source/.virtualenvs
export PROJECT_HOME=~/Source
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Use homebrew coreutils by default
export PATH="/usr/local/Homebrew/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH:~/Applications/bin"
if [[ "$EUID" -ne 0 ]]; then
	export PATH="/usr/local/sbin:$PATH"
fi
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"