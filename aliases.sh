alias grep='grep --color=auto'

alias ll='gls --color=auto -l --almost-all --group-directories-first --classify --human-readable'
alias l.='gls --color=auto --directory --group-directories-first --classify .*'
alias ls='gls -p --classify --color=auto --group-directories-first --ignore-backups'
# alias ..='cd ..'
# alias cd..='cd ..'

alias gs='git status '
alias ga='git add '
alias gd='git diff'
alias gca='git commit -a'

alias c='clear'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root --dir'

alias df='df --human-readable --total '
alias du='du -ch | sort --human-numeric-sort '

alias src='source ~/.profile'

alias ax='chmod a+x'

# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

alias ping='ping -c 5 -i 0.2'
alias pgw='\ping -c 3 -i 0.2 192.168.1.1'

alias less="most"
alias more="most"
