#!/usr/bin/env bash
set -euo pipefail

current_layout=$(hyprctl getoption general:layout -j | jq -er '.str')

case "$current_layout" in
	dwindle) next_layout=master ;;
	master) next_layout=scrolling ;;
	scrolling) next_layout=dwindle ;;
	*) next_layout=dwindle ;;
esac

hyprctl eval "hl.config({ general = { layout = '$next_layout' } })" >/dev/null
