# BASH STUFF

PS1="\[\033[0;32m\][\h]\[\033[0m\] \w # "

#alias vi='vim'
alias sm='server-manager'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls --color=auto'
alias ans='ps aux | grep sm_ansible_server.py | grep -v grep | tr -s " " | cut -d " " -f 2'
alias depl='cd /root/contrail-ansible-deployer'
alias kolla='cd /root/contrail-kolla-ansible'
#alias vi='vim'

