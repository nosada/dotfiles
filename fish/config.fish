set -gx PATH "$HOME/Scripts/" $PATH

function fish_greeting
  fortune -a | cowsay | lolcat
  echo
end
funcsave fish_greeting

fish_vi_key_bindings

# vim:set ts=2 sw=2 et:
