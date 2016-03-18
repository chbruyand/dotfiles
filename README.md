# Dotfiles

## Usage

``` bash
git clone https://github.com/chbruyand/dotfiles ~/.dotfiles
```

``` bash
ln -s ~/.dotfiles/git/config ~/.gitconfig
ln -s ~/.dotfiles/emacs/conf ~/.emacs
ln -s ~/.dotfiles/mercurial/config ~/.hgrc

cat <<EOF >> ~/.profile
source ~/.dotfiles/bash/env
source ~/.dotfiles/bash/aliases
EOF
```