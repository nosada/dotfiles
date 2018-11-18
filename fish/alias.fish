# vim:set ts=2 sw=2 et:

# replacement of command
alias diff='colordiff'
alias du='cdu -isdh'
alias top='htop'
alias df='dfc'

# definition of new alias
alias C='xsel --input --clipboard'
alias open='xdg-open'
alias clean-git-repo='git clean -dfx; git reset --hard' # yes it's alias to git comman but dangerous for removing files

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

# shortened systemd-relate utilities
test (which systemctl); and alias s='systemctl'
test (which machinectl); and alias m='machinectl'
test (which resolvectl); and alias r='resolvectl'
test (which journalctl); and alias j='journalctl'
test (which networkctl); and alias n='networkctl'
