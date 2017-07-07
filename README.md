# Dotfiles

## Usage

### Installation

``` bash
git clone https://github.com/chbruyand/dotfiles ~/.dotfiles
cd ~/.dotfiles
make install
```

### Uninstallation

```bash
cd ~/.dotfiles
make uninstall
```

## Mac setup

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
env PATH=$PATH:/usr/sbin/ bash -x $HOME/.dotfiles/.macos
```
