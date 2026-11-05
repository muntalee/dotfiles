#!/usr/bin/env bash
set -euo pipefail

active_window=$(hyprctl activewindow -j)
window_class=$(jq -r '.class // .initialClass // empty' <<<"$active_window" | tr '[:upper:]' '[:lower:]')
active_pid=$(jq -r '.pid // empty' <<<"$active_window")

case "$window_class" in
	kitty|foot|alacritty|org.gnome.console|gnome-terminal|kgx|konsole|wezterm|urxvt|xterm)
		;;
	*)
		exec uwsm-app -- nautilus
		;;
esac

is_shell() {
	case "$1" in
		bash|dash|fish|ksh|mksh|nu|sh|tcsh|zsh)
			return 0
			;;
		*)
			return 1
			;;
	esac
}

process_cwd() {
	local process_pid=$1
	local cwd

	cwd=$(readlink -f "/proc/$process_pid/cwd" 2>/dev/null) || return 1
	[[ -d "$cwd" ]] || return 1
	printf '%s\n' "$cwd"
}

queue=("$active_pid")
while ((${#queue[@]})); do
	process_pid=${queue[0]}
	queue=("${queue[@]:1}")

	process_name=$(ps -o comm= -p "$process_pid" 2>/dev/null | tr -d '[:space:]')
	if is_shell "$process_name"; then
		if cwd=$(process_cwd "$process_pid"); then
			exec uwsm-app -- nautilus --new-window "$cwd"
		fi
	fi

	children=$(cat "/proc/$process_pid/task/$process_pid/children" 2>/dev/null || true)
	for child_pid in $children; do
		queue+=("$child_pid")
	done
done

exec uwsm-app -- nautilus
