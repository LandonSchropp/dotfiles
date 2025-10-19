# Set the default text editor
export EDITOR="nvim"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# mise-en-place
eval "$(mise activate zsh --shims)"

# Cross-Desktop Group (XDG)
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
export PATH="$XDG_BIN_HOME:$PATH"

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"
