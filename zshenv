# Set the default text editor
export EDITOR="nvim"

# The directories that should outrank the system ones in $PATH, highest precedence last.
zshenv_path=()

# Homebrew
zshenv_path=("/opt/homebrew/bin" $zshenv_path)

# Cross-Desktop Group (XDG)
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
zshenv_path=("$XDG_BIN_HOME" $zshenv_path)

# mise-en-place
zshenv_path=("$XDG_DATA_HOME/mise/shims" $zshenv_path)

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
zshenv_path=("$PNPM_HOME" $zshenv_path)

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  # shellcheck source=/dev/null
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# Obsidian
zshenv_path=($zshenv_path "/Applications/Obsidian.app/Contents/MacOS")

# macOS's /etc/zprofile reorders $PATH after this file runs, so ~/.zprofile prepends these again.
typeset -U path
path=($zshenv_path $path)
