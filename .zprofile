#for reading .bashrc setting
alias la='ls -la'
alias ll='ls -l'

# activate enhancd
source ~/Projects/enhancd/init.sh

alias ga='git add .'
alias gd='git diff'
alias gs='git status'
alias gc='git commit -m'
alias gplo='git pull origin'
alias gpso='git push origin'
alias grb='git rebase'
alias gcmsg="git commit -m"
alias s='subl .'
alias ms='mysql -uu-kan -p'
alias g='git'
alias fz="find * -type f | fzf > selected"
alias vfz='vim $(fzf)'
alias find-huge-file="find ~/* -size +100M -exec ls -lah {} \;"
alias gt="git today"
alias gtd="git today-full"


