# This files contains aliases and simple wrappers of built-in commands.

# Bundler
alias be='bundle exec'

# This function is just like the built-in touch command, but it also automatically makes the
# directories the file is contained in.
function touch {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}

# Override the ls and tree command with better version from Eza.
alias ls="eza --all --icons --ignore-glob '.DS_Store|.git|node_modules'"
alias lsg="eza --all --icons --git-ignore --ignore-glob .DS_Store"
alias tree="eza --tree --all --icons --ignore-glob '.DS_Store|.git|node_modules'"
alias treeg="eza --tree --all --icons --git-ignore --ignore-glob .DS_Store"

# Override the cd command with Zoxide.
alias cd="z"

# Enable source highlighting in less.
export LESSOPEN="| $(brew --prefix)/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Make bat more readable.
export BAT_THEME="tokyonight_moon"
