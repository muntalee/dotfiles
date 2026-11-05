#!/usr/bin/env bash
set -euo pipefail

if [[ ${EUID:-$(id -u)} -eq 0 ]]; then
  printf '%s\n' 'Run this as your normal user; it invokes sudo only for pacman.' >&2
  exit 1
fi

if [[ ! -r /etc/os-release ]]; then
  printf '%s\n' 'Cannot identify the operating system.' >&2
  exit 1
fi

# shellcheck disable=SC1091
source /etc/os-release
if [[ ${ID:-} != arch && ${ID_LIKE:-} != *arch* ]]; then
  printf '%s\n' 'This installer supports Arch Linux only.' >&2
  exit 1
fi

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

official_packages=(
  bash bat btop brightnessctl blueman direnv eza fastfetch fd foot fuzzel fzf
  gammastep git github-cli ghostty grim helix hyprland hyprlock hyprpolkitagent
  i3status jq kitty lazygit lf mpv nautilus neovim networkmanager noctalia npm
  nwg-displays opencode pipewire pipewire-pulse playerctl ripgrep slurp starship
  sway swaybg swayidle tmux ttf-jetbrains-mono-nerd uwsm wl-clipboard wireplumber
  xdg-utils zoxide zsh
)
aur_packages=(nvm swaylock-effects-git waypaper)

sudo pacman -S --needed "${official_packages[@]}"

aur_helper=""
if command -v yay >/dev/null 2>&1; then
  aur_helper=yay
elif command -v paru >/dev/null 2>&1; then
  aur_helper=paru
fi

if [[ -n $aur_helper ]]; then
  "$aur_helper" -S --needed "${aur_packages[@]}"
else
  printf '%s\n' 'No yay or paru found; install these AUR packages manually:' >&2
  printf '  %s\n' "${aur_packages[*]}" >&2
fi
printf '%s\n' 'studytime has no package in the configured Arch repositories/AUR; install its upstream binary separately if needed.' >&2

backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d%H%M%S)"
backup_path() {
  local destination=$1
  if [[ -e $destination || -L $destination ]]; then
    mkdir -p "$backup_dir/$(dirname -- "${destination#"$HOME/"}")"
    mv -- "$destination" "$backup_dir/${destination#"$HOME/"}"
  fi
}

link_entry() {
  local source=$1
  local destination=$2
  if [[ -L $destination && $(readlink -- "$destination") == "$source" ]]; then
    return
  fi
  backup_path "$destination"
  mkdir -p "$(dirname -- "$destination")"
  ln -s -- "$source" "$destination"
}

# Link every tracked home/config entry while leaving ignored application state alone.
while IFS= read -r -d '' entry; do
  [[ -e $entry ]] || continue
  relative=${entry#"$repo_dir/"}
  link_entry "$entry" "$HOME/$relative"
done < <(
  git -C "$repo_dir" ls-files -z \
    '.bash_logout' '.bash_profile' '.bashrc' '.gitconfig' '.zshenv' '.config/**'
)

# Install the plugins referenced by .config/zsh/plugins.zsh.
plugin_dir="$HOME/.config/zsh/plugins"
mkdir -p "$plugin_dir"
declare -A zsh_plugins=(
  [zsh-autosuggestions]=https://github.com/zsh-users/zsh-autosuggestions.git
  [zsh-history-substring-search]=https://github.com/zsh-users/zsh-history-substring-search.git
  [zsh-vi-mode]=https://github.com/jeffreytse/zsh-vi-mode.git
  [fast-syntax-highlighting]=https://github.com/zdharma-continuum/fast-syntax-highlighting.git
)
for plugin in "${!zsh_plugins[@]}"; do
  if [[ ! -d "$plugin_dir/$plugin/.git" ]]; then
    git clone --depth=1 "${zsh_plugins[$plugin]}" "$plugin_dir/$plugin"
  fi
done

# Install TPM for the plugins declared by tmux.conf.
tpm_dir="$HOME/.tmux/plugins/tpm"
if [[ ! -d "$tpm_dir/.git" ]]; then
  mkdir -p "$(dirname -- "$tpm_dir")"
  git clone --depth=1 https://github.com/tmux-plugins/tpm "$tpm_dir"
fi

if [[ -d $backup_dir ]]; then
  printf 'Existing files were backed up to %s\n' "$backup_dir"
fi
printf '%s\n' 'Dotfiles installed. Start a new shell or run: exec zsh'
