set -x PATH $PATH "$HOME/Scripts"

if which -a nvim > /dev/null
  set -x EDITOR nvim
end

if test -e /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end

if status is-interactive
  fish_vi_key_bindings
end

thefuck --alias | source

# vim:set ts=2 sw=2 et:
