source ~/.zshenv

ZSH_THEME=robbyrussell

DISABLE_AUTO_TITLE="true"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    autojump
)

source $ZSH/oh-my-zsh.sh

#
# ALIASES
#

# open a file in directory with v and ctrl-e
function v() {
    fzf --preview="bat {} --color=always" | xargs nvim
}

alias vimlazy='NVIM_APPNAME=lazynvim nvim'
alias vim='nvim'

alias vimr='/Applications/VimR.app/Contents/MacOS/VimR'

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias rf="rm -rf"
alias so="source"
alias cls='clear'

alias cd='z'

alias t='tmux-session'

alias imgcat='wezterm imgcat'

alias cat="bat"

alias gvim='neovide'
alias ls='eza'
alias ll='eza -alh'
alias idle='ipython3'

alias nano='/opt/homebrew/bin/nano'

alias nvchad='NVIM_APPNAME=nvchad nvim'

alias tmudrive='cd ~/md.m.islam@torontomu.ca\ -\ Google\ Drive'
alias obsidian_drive='cd ~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/main/'
alias tmu='ssh moon.cs.ryerson.ca'
alias foxtheme="cd '/Users/munta/Library/Application Support/Firefox/Profiles/cmgqoc5x.default-release/chrome'"

alias zspotify='python3 ~/dev/zspotify/zspotify.py'
alias resetaudio='sudo pkill coreaudiod'
alias mvim='/Applications/MacVim.app/Contents/bin/mvim'

alias neovide='/Applications/neovide.app/Contents/MacOS/neovide'

force_color_prompt=yes

alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

alias portacle='/Applications/Portacle/mac/bin/portacle'

alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"
alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function conda_init () {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
            . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
        else
            export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}

function b() {
    if [ -z "$1" ] || [ "$1" = "--help" ]; then
        printf "%s\n" "Usage: b integer"
        return 0
    fi
    m1ddc set luminance $1 > /dev/null
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function ghcup_init () {
    [ -f "/Users/munta/.ghcup/env" ] && source "/Users/munta/.ghcup/env" # ghcup-env
}

export PATH=$PATH:/usr/local/sbin

neofetch
