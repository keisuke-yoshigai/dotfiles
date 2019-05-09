# general alias
alias l='clear && ls -hlAG'
alias ll='clear && ls -hlAG'
alias lll='clear && ls -hlAG'
alias grep='grep --color=auto'
alias vi='vim'
alias less='less -NM'
alias gore='gore -autoimport'

# git alias
alias ga='git add'
alias gb='git branch'
alias gco='git commit'
alias gch='git checkout'
alias gd='git diff'
alias gl='git log'
alias gs='git status'

# export
export GOPATH=$HOME/dev
export GOBIN=$HOME/dev/bin
export PATH=$HOME/anaconda/bin:$PATH:$GOPATH/bin
export PYTHONPATH=$HOME/anaconda/bin/python3.6/site-packages/
