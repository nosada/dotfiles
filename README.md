# How to use

```
$ git clone https://github.com/nosada/dotfiles.git ${HOME}/.dotfiles
```

and then:

## deploy dotfiles:

```
$ ${HOME}/.dotfiles/deploy.sh
```

## clean dotfiles:

```
$ ${HOME}/.dotfiles/clean.sh
```

# Covered configs
- tmux
- vim
- neovim
- fish
- aria2

# Included scripts
Below scripts are in `scripts/`:

- `aria2c-normal`: aria2c wrapper to download file via HTTP(S)
- `aria2c-torrent`: same as `aria2c-normal`, but download via Torrent
- `generate-random-string`: generate random string from `/dev/urandom`
- `hello`: initialize and update my daily use environment
