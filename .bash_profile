source ~/.git-prompt.sh
export PS1='\n\[\e[1;33m\]\u@\h \t \w\[\e[0m\]\[\e[1;32m $(__git_ps1 "(%s)") \[\e[0m\] jobs:\j\n\$ '

