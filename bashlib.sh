#!/usr/local/bin/bash

# printf rule from Brett Terpstra
# http://brettterpstra.com/2015/02/20/shell-trick-printf-rules/
rule () {
    printf -v _hr "%*s" "$(tput cols)" && echo "${_hr// /${1--}}"
}

rulem () {
    if [ $# -eq 0 ]; then
        echo "Usage: rulem MESSAGE [RULE_CHARACTER]"
        return 1
    fi
    # Fill line with ruler character ($2, default "-"), reset cursor,
    # move 2 cols right, print message
    printf -v _hr "%*s" "$(tput cols)" && echo -en "${_hr// /${2--}}" && echo -e "\r\033[2C$1"
}

dir_exists() {
	local var=$1
	[[ -d "$var" ]]
}

file_exists() {
	local var=$1
	[[ -f "$var" ]]
}

is_empty() {
	local var=$1
	[[ -z "$var" ]]
}

is_not_empty() {
	local var=$1
	[[ -n "$var" ]]
}

print_status() {
	local c1_msg=$1
	local c2_msg=$2

	local RESET=$(tput sgr0)
	local C1=$(tput setaf 226)             # color 1: yellow
	local C2=$(tput bold)$(tput setaf 15)  # color 2: bold white
	rulem " $C1$c1_msg $C2$c2_msg$RESET "
}

print_step() {
	local c1_msg=$1
	local c2_msg=$2

	local RESET=$(tput sgr0)
	local C1=$(tput setaf 178)             # color 1: yellow
	local C2=$(tput bold)$(tput setaf 15)  # color 2: bold white
	local ARROW="$C2\u21e8"
	echo -e "  $ARROW  $C1$c1_msg $C2$c2_msg$RESET"
}

print_error() {
	local c1_msg=$1

	local RESET=$(tput sgr0)
	local C1=$(tput bold)$(tput setaf 196)  # color 1: red
	echo -e "$C1$c1_msg$RESET"
}
