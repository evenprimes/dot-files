#!/usr/local/bin/bash

# printf rule from Brett Terpstra
# http://brettterpstra.com/2015/02/20/shell-trick-printf-rules/
rule () {
    printf -v _hr "%*s" $(tput cols) && echo ${_hr// /${1--}}
}

rulem () {
    if [ $# -eq 0 ]; then
        echo "Usage: rulem MESSAGE [RULE_CHARACTER]"
        return 1
    fi
    # Fill line with ruler character ($2, default "-"), reset cursor,
    # move 2 cols right, print message
    printf -v _hr "%*s" $(tput cols) && echo -en ${_hr// /${2--}} && echo -e "\r\033[2C$1"
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
	[[ -n "$var"]]
}
