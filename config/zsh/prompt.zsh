# Set the prompt to Starship
eval "$(starship init zsh)"
autoload -U promptinit; promptinit

# Restore cursor visibility before each prompt in case a program hid it
_restore_cursor() { printf '\e[?25h'; }
precmd_functions+=(_restore_cursor)
