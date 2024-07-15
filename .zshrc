# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

plugins=(git dnf sudo npm zsh-better-npm-completion copyfile copypath dirhistory zsh-autosuggestions gradle command-not-found zsh-interactive-cd)

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# zoxide config
eval "$(zoxide init zsh)"

# OnePassword
export SSH_AUTH_SOCK=~/.1password/agent.sock

# Chrome Bin
export CHROME_BIN="/var/lib/flatpak/app/io.github.ungoogled_software.ungoogled_chromium/current/active/export/bin/io.github.ungoogled_software.ungoogled_chromium"

# fnm
FNM_PATH="/home/dafnik/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/dafnik/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

eval "$(fnm env --use-on-cd)"

# pnpm
export PNPM_HOME="/home/dafnik/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Aliases
alias pn=pnpm
alias pnx="pnpm dlx"
alias lazydocker="/home/dafnik/.local/bin/lazydocker"
alias ld=lazydocker
alias vim=nvim
alias ls="ls -la"

