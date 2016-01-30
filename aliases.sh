alias grep='grep --color=auto'

alias ll='gls --color=auto -l --almost-all --group-directories-first --classify --human-readable'
alias l.='gls --color=auto --directory --group-directories-first --classify .*'
alias ls='gls -p --classify --color=auto --group-directories-first --ignore-backups'
alias ..='cd ..'
alias cd..='cd ..'

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gca='git commit -a'
alias glog='git log'

alias c='clear'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root --dir'

alias df='df -H'
alias du='du -ch'

alias src='source ~/.profile'

alias ax='chmod a+x'

# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

alias ping='ping -c 5'
