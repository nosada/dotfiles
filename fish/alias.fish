# vim:set ts=2 sw=2 et:

# replacement of commands
alias vim='nvim'
alias diff='colordiff'

# abbreviation for git command
alias ga='git add'
alias gaa='git add -A'
alias gl='git log'
alias glg='git log --graph'
alias glgo='git log --graph --oneline'
alias gd='git diff'
alias gp='git pull -p'
alias gc='git checkout'
alias gch='git cherry-pick'
alias gcl='git clone'
alias gcv='git commit -v'
alias gf='git fetch'
alias gm='git merge'
alias gs='git status'
alias gt='git stash'
alias gb='git branch'
alias gr='git remote -v'
alias gpcb='git push -u origin HEAD'  # Git Push Current Branch

# shortened activities
alias u='cd ..'
alias uu='cd ../..'
alias p='pwd'
alias l='ls -alh'
alias h='hostname'
alias ta='tmux attach -d'
alias a2n="aria2c --conf-path $HOME/.config/aria2/aria2.conf"
alias a2t="aria2c --conf-path $HOME/.config/aria2/aria2.conf.bittorrent"
