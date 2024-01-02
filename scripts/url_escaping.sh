#!/bin/bash

# Color codes
GREEN="\033[1;32m"   # Bright green
PINK="\033[1;95m"    # Bright pink
RESET="\033[0m"


unescape_url() {
	if [ -n "$1" ]; then
		url=$(echo -n "$1")
	else
		url=$(pbpaste)
	fi
	result=$(echo -n "$url" | perl -MURI::Escape -ne 'chomp;print uri_unescape($_),"\n"')

	printf "${GREEN}Unescaped URL:${RESET}\n"
	printf "\t${PINK}%s${RESET}\n" "$result"
	echo -n "$result" | pbcopy
	printf "${GREEN}Copied to clipboard${RESET}\n"
}
