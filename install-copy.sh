#!/usr/bin/env bash

# Handle selections - either from arguments or print options
if [ $# -eq 0 ]; then
	echo "Available packages:"
	find . -maxdepth 1 -type d -not -path "." | sed 's|^\./|  |'
	echo "Please provide one or more packages as arguments."
	exit 1
fi

# Packages must be directories
for sel in "$@"; do
	if [ ! -d "$sel" ]; then
		echo "Error: '$sel' is not a valid package"
		exit 1
	fi
done

# For each package
for pkg in "$@"; do
	# Use stow to determine paths
	stow_output=$(stow --simulate --no-folding "$pkg" 2>&1)
	stow_exit=$?

	# If stow fails, exit
	if [ $stow_exit -ne 0 ]; then
		echo "$stow_output"
		echo "Stow simulation failed for package $pkg. Aborting."
		exit $stow_exit
	fi

	# Parse stow output
	# Use LINK to get source and destination paths
	parsed_output=$(echo "$stow_output" | awk '
		/^LINK:/ {
			split(substr($0, 7), a, " => ")
			print a[1] "\t" a[2]
		}
	')

	# Parse the output into source and destination pairs
	echo "$parsed_output" | while IFS=$'\t' read -r dst src; do
		bat "$pkg"/"$src"
		echo $dst

		# cp "$pkg/$src" "$dst"
	done
	echo
done
