#
# From Brett Terpstra
# http://brettterpstra.com/2015/01/05/sizeup-tidy-filesize-information-in-terminal/
#
__sizeup_build_query () {
	local bool="and"
	local query=""
	for t in $@; do
		query="$query -$bool -iname \"*.$t\""
		bool="or"
	done
	echo -n "$query"
}

__sizeup_humanize () {
	local size=$1
	if [ $size -ge 1073741824 ]; then
		printf '%6.2f%s' $(echo "scale=2;$size/1073741824"| bc) G
	elif [ $size -ge 1048576 ]; then
		printf '%6.2f%s' $(echo "scale=2;$size/1048576"| bc) M
	elif [ $size -ge 1024 ]; then
		printf '%6.2f%s' $(echo "scale=2;$size/1024"| bc) K
	else
		printf '%6.2f%s' ${size} b
	fi
}

sizeup () {
	local helpstring="Show file sizes for all files with totals\n-r\treverse sort\n-[0-3]\tlimit depth (default 4 levels, 0=unlimited)\nAdditional arguments limit by file extension\n\nUsage: sizeup [-r[0123]] ext [,ext]"
	local totalb=0
	local size output reverse OPT
	local depth="-maxdepth 4"
	readonly local STATCMD="/usr/bin/stat"

	OPTIND=1
	while getopts "hr0123" opt; do
		case $opt in
			r) reverse="-r " ;;
			0) depth="" ;;
			1) depth="-maxdepth 1" ;;
			2) depth="-maxdepth 2" ;;
			3) depth="-maxdepth 3" ;;
			h) echo -e $helpstring; return;;
			\?) echo "Invalid option: -$OPTARG" >&2; return 1;;
		esac
	done
	shift $((OPTIND-1))

	local cmd="find . -type f ${depth}$(__sizeup_build_query $@)"
	local counter=0
	while read -r file; do
		counter=$(( $counter+1 ))
		size=$($STATCMD -f '%z' "$file")
		totalb=$(( $totalb+$size ))
		>&2 echo -ne $'\E[K\e[1;32m'"${counter}:"$'\e[1;31m'" $file "$'\e[0m'"("$'\e[1;31m'$size$'\e[0m'")"$'\r'
		# >&2 echo -n "$(__sizeup_humanize $totalb): $file ($size)"
		# >&2 echo -n $'\r'
		output="${output}${file#*/}*$size*$(__sizeup_humanize $size)\n"
	done < <(eval $cmd)
	>&2 echo -ne $'\r\E[K\e[0m'
	echo -e "$output"| sort -t '*' ${reverse}-nk 2 | cut -d '*' -f 1,3 | column -s '*' -t
	echo $'\e[1;33;40m'"Total: "$'\e[1;32;40m'"$(__sizeup_humanize $totalb)"$'\e[1;33;40m'" in $counter files"$'\e[0m'
}

# Function to get matplotlib to work in a virtualenv.
# http://matplotlib.org/devdocs/faq/virtualenv_faq.html

function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}

# Top 10 history commands from:
# http://www.cyberciti.biz/howto/shell-primer-configuring-your-linux-unix-osx-environment/
function ht {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# Upgrade all pip packages.
pipupgradeall() {
	if [[ -n "$VIRTUAL_ENV" ]]; then
		pip list -o \
		| cut -d " " -f 1 \
		| tr "\n" " " \
		| xargs pip install -U
	else
		read -rN 1 -p "Are you sure you want to update the SYSTEM PYTHON? [y/n] " yn
		case $yn in
			[Yy]* )
				pip3 list -o \
				| cut -d " " -f 1 \
				| tr "\n" " " \
				| xargs sudo pip3 install -U
				;;
			*)
				;;
		esac
	fi
}

up() {
	local var=$1
	local dir=

	if [[ -z "$var" ]]; then
		dir=..
	elif [[ "$var" =~ ^[0-9]+$ ]]; then
		local i=1
		while [[ $i -le $var ]]; do
			dir="$dir../"
			i=$((i+1))
		done
	else
		dir="../$var"
	fi

	builtin cd "$dir"
}

json() {
	local ARGS="$@"
	python3 -m json.tool < "$ARGS" | pygmentize -l js
}

e() {
	local ARGS="$@"
	if [[ -z "$ARGS" ]]; then
		subl .
	else
		subl $@
	fi
}

# From: https://emson.co.uk/2009/06/18-useful-bash-scripts-for-web-developers/
# function to change directory to the one set in the last opened finder.
cdf () {
   currFolderPath=$( /usr/bin/osascript << EOT
       tell application "Finder"
           try
               set currFolder to (folder of the front window as alias)
           on error
               set currFolder to (path to desktop folder as alias)
           end try
           POSIX path of currFolder
       end tell
EOT
   )
   echo "cd to \"$currFolderPath\""
   builtin cd "$currFolderPath"
}

fn() {
	gfind . -iname "*$1*" -print
}

hex() {
	printf "%d: 0x%X\n" "$1" "$1"
}
