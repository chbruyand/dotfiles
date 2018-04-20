SHELL := /usr/bin/env bash

.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z1-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

install: ## Install all the things
	@make install-dotfiles \
		install-base16

install-dotfiles: ## Pull and Install dotfiles
	@git pull -q # && git submodule update --init --recursive -q
	@mkdir -m 0700 -p ~/.ssh ~/.gnupg ~/.config/kitty
	@which stow >/dev/null || { echo 'CAN I HAZ STOW ?'; exit 1; }
	@stow -S . -t "$(HOME)" -v \
		--ignore='README.md' \
		--ignore='LICENCE' \
		--ignore='Makefile'

install-base16: ## Install base16, the color schemes for hackers
	$(info --> Install base16)
	@[[ -d ~/.base16-shell ]] \
		|| git clone https://github.com/chriskempson/base16-shell ~/.base16-shell
	@[[ -d ~/.base16-iterm2 ]] \
		|| git clone https://github.com/chriskempson/base16-iterm2 ~/.base16-iterm2
	$(info --> Update base16)
	@pushd ~/.base16-shell &>/dev/null \
		&& git pull --quiet \
		&& popd &>/dev/null
	@pushd ~/.base16-iterm2 &>/dev/null \
		&& git pull --quiet \
		&& popd &>/dev/null


uninstall: uninstall-dotfiles ## Uninstall all the things

uninstall-dotfiles: ## Uninstall dotfiles
	@stow -D . -t "$(HOME)" -v \
		--ignore='README.md' \
		--ignore='LICENCE' \
		--ignore='Makefile'
