# vim:set ts=2 sw=2 et:

set PATH $PATH /usr/local/bin {$HOME}/Scripts

alias diff='colordiff'
alias du='cdu -isdh'
alias top='htop'
alias df='dfc'
alias C='xsel --input --clipboard'
alias rm='trash-put'

function fish_greeting
  fortune -a | cowsay
  echo
end
funcsave fish_greeting
