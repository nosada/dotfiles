set GNU_PATH ""
if test -e /opt/homebrew/opt/coreutils/libexec/gnubin
  set GNU_PATH "/opt/homebrew/opt/coreutils/libexec/gnubin" "$GNU_PATH"
end
if test -e /opt/homebrew/opt/gnu-sed/libexec/gnubin
  set GNU_PATH "/opt/homebrew/opt/gnu-sed/libexec/gnubin" "$GNU_PATH"
end
if test -e /opt/homebrew/opt/gnu-tar/libexec/gnubin
  set GNU_PATH "/opt/homebrew/opt/gnu-tar/libexec/gnubin" "$GNU_PATH"
end
set -x PATH "$GNU_PATH" "$HOME/Scripts"

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
