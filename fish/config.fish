# vim:set ts=2 sw=2 et:

alias diff='colordiff'
alias du='cdu -isdh'
alias top='htop'
alias df='dfc'
alias ls='ls --color --group-directories-first'
alias C='xsel --input --clipboard'
alias open='xdg-open'

function fish_greeting
  fortune -a | cowsay | lolcat
  echo
end
funcsave fish_greeting

fish_vi_key_bindings
