set -x PATH $PATH "$HOME/Scripts"

if which -a nvim > /dev/null
  set -x EDITOR nvim
end

if status is-interactive
  fish_vi_key_bindings
end

# vim:set ts=2 sw=2 et:
