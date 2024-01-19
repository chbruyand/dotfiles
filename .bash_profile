# Load profiles from ~/.profile.d
if test -d ~/.profile.d/; then
	for profile in ~/.profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Also load subshell settings
test -r "${HOME}/.bashrc" && . "${HOME}/.bashrc"
