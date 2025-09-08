# Disable automatically setting the title.
export DISABLE_AUTO_TITLE="true"

# Set the default text editor
export EDITOR="nvim"

# Disable Spring 😡
export DISABLE_SPRING="true"

# Disable Homebrew hints.
export HOMEBREW_NO_ENV_HINTS="1"

# Disable Homebrew new formulae and cask messages on update.
export HOMEBREW_NO_UPDATE_REPORT_NEW="1"

# The home directory for configuration. This isn't required, but some apps will use it if it's
# defined.
export XDG_CONFIG_HOME="$HOME/.config"

# The directory where the Obsidian vault is stored.
export OBSIDIAN_VAULT="$HOME/Notes"

# Disable the GitHub CLI notification updates. (They're super annoying.)
export GH_NO_UPDATE_NOTIFIER=1

# Set the bat theme.
export BAT_THEME="tokyonight_moon"

# Enable source highlighting in less.
export LESSOPEN="| $(brew --prefix)/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Set the Cross-Desktop Group (XDG) directories. This standard is used by a lot of applications.
# Most will look in the following directory even if these environment variables aren't set, but it's
# still nice to have it available.
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
