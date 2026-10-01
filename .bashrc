[[ $- != *i* ]] && return

export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-$EDITOR}"
export BROWSER="${BROWSER:-xdg-open}"
export BAT_THEME="${BAT_THEME:-ansi}"
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH="$HOME/.local/bin:$PATH"

shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="$HISTSIZE"
set +h

if command -v starship >/dev/null 2>&1 && [[ ${TERM:-} != dumb ]]; then
    eval "$(starship init bash)"
fi

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
    zd() {
        if (( $# == 0 )); then
            builtin cd ~ || return
        elif [[ -d $1 ]]; then
            builtin cd "$1" || return
        else
            z "$@" || { echo "Directory not found" >&2; return 1; }
        fi
    }
    alias cd=zd
fi

if command -v direnv >/dev/null 2>&1; then
    eval "$(direnv hook bash)"
fi

if command -v eza >/dev/null 2>&1; then
    alias ls='eza -lh --group-directories-first --icons=auto'
    alias lsa='ls -a'
    alias lt='eza --tree --level=2 --long --icons --git'
    alias lta='lt -a'
fi

if command -v fzf >/dev/null 2>&1 && command -v bat >/dev/null 2>&1; then
    ff() { find . -type f -print | fzf --preview 'bat --style=numbers --color=always {}'; }
    eff() { local file; file="$(ff)" && [[ -n "$file" ]] && "$EDITOR" "$file"; }
fi

alias vim=nvim
# alias vim="helix"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias g=git
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias t='tmux attach || tmux new -s Work'
alias d=docker
alias r=rails
alias open='xdg-open'
alias copilot="copilot --yolo"
alias chat="copilot --yolo"
alias hx="helix"

n() {
    if (( $# == 0 )); then command nvim .; else command nvim "$@"; fi
}

compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }
alias decompress='tar -xzf'

source "$HOME/.config/shell/functions" 2>/dev/null || true

