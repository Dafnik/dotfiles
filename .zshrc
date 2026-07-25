if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

# Replay completion definitions captured while loading plugins
zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias pnx='pnpm dlx'

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # 1Password
    export SSH_AUTH_SOCK=~/.1password/agent.sock

    # Chrome Bin
    export CHROME_BIN="/var/lib/flatpak/app/io.github.ungoogled_software.ungoogled_chromium/current/active/export/bin/io.github.ungoogled_software.ungoogled_chromium"

    # lazydocker
    alias lazydocker="/home/dafnik/.local/bin/lazydocker"

    # Jetbrains
    JETBRAINS_PATH="/home/dafnik/.local/share/JetBrains/Toolbox/scripts"
    if [ -d "$JETBRAINS_PATH" ]; then
        export PATH="$JETBRAINS_PATH:$PATH"
    fi

    function intellij() { ( idea "$@" & ) > /dev/null 2>&1 }
    function code() { ( webstorm "$@" & ) > /dev/null 2>&1 }

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # 1Password
    export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

    # MAKE SURE USER IS ALLOWED TO WRITE INTO THIS FOLDER
    mkdir -p /opt/1Password
    ln -s -f /Applications/1Password.app/Contents/MacOS/op-ssh-sign /opt/1Password/op-ssh-sign
fi

# Vite+ bin (https://viteplus.dev)
. "$HOME/.vite-plus/env"

killPort() {
    sudo kill -9 $(sudo lsof -t -i:$1) 2>/dev/null && echo "Killed process on port $1" || echo "No process found on port $1"
}

# Redirect npx to pnpm dlx
npx() {
  pnpm dlx "$@"
}


cloc() {
    pnpm dlx cloc . --fullpath --exclude-dir=node_modules,.pnpm,.pnpm-store,.npm,.yarn,.git,.cache,.angular,.astro,.turbo,.nx,.next,.nuxt,.svelte-kit,.vite,.parcel-cache,.vercel,.netlify,.serverless,.wrangler,dist,build,out,coverage,storybook-static,tmp,temp,vendor,generated,.output --not-match-f='(^|/)(pnpm-lock\.yaml|package-lock\.json|npm-shrinkwrap\.json|yarn\.lock|bun\.lockb?|.*\.min\.(js|css)|.*\.map)$'
}

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config "$HOME/.config/omp.toml")"
