#!/bin/bash

#==================================================
# Files to add to git
#==================================================
CONFIG_TARGETS="
	$HOME/.config/quickshell/
	$HOME/.config/hypr/
	$HOME/.config/ghostty/
	$HOME/.config/rofi/
	$HOME/.bashrc
	$HOME/.gitignore
	$HOME/autoGit.sh
	$HOME/README.md
"

#==================================================
# Main
#==================================================
if ! command -v config >/dev/null 2>&1; then
	printf "Error: 'config' command not found\n"
	printf "Make sure the config command is installed and in your PATH\n"
	exit 1
fi

printf "Adding configured files and directories to config...\n\n"

for target in $CONFIG_TARGETS; do
	[ -z "$target" ] && continue

	if [ -e "$target" ]; then
		if config add "$target" 2>&1; then
			printf "Added: %s\n" "$target"
		else
			printf "Failed to add: %s\n" "$target"
		fi
	else
		printf "Skipping (not found): %s\n" "$target"
	fi

	echo
done