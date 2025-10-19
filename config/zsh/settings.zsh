# Disable automatically setting the title.
export DISABLE_AUTO_TITLE="true"

# Disable Spring 😡
export DISABLE_SPRING="true"

# Disable Homebrew hints.
export HOMEBREW_NO_ENV_HINTS="1"

# Disable Homebrew new formulae and cask messages on update.
export HOMEBREW_NO_UPDATE_REPORT_NEW="1"

# Disable the GitHub CLI notification updates. (They're super annoying.)
export GH_NO_UPDATE_NOTIFIER=1

# Set the bat theme.
export BAT_THEME="tokyonight_moon"

# Enable source highlighting in less.
export LESSOPEN="| $(brew --prefix)/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
