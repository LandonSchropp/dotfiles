# FIX: tmuxinator mangles the $GEM_HOME environment variable. This is a quick and dirty fix.
# https://github.com/tmuxinator/tmuxinator/issues/841
unset GEM_HOME

# Set the path to Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"

# Oh My Zsh plugins
plugins=(
  alias-finder
  brew
  bundler
  colored-man-pages
  command-not-found
  direnv
  git
  github
  httpie
  iterm2
  kubectl
  node
  npm
  macos
  postgres
  pyenv
  python
  rails
  rake
  rbenv
  ripgrep
  ruby
  tmux
  yarn
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Set the prompt to Starship
eval "$(starship init zsh)"
autoload -U promptinit; promptinit

# Enable source highlighting in less.
export LESSOPEN="| $(brew --prefix)/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Make bat more readable.
export BAT_THEME="tokyonight_moon"

# Source the configuration files
for CONFIG_FILE in $HOME/.config/zsh/*; do
  source $CONFIG_FILE
done

# Disable autocorrect
unsetopt correct_all

# Prevent OA from getting typed when hitting <esc><up> in the terminal.
# https://superuser.com/a/1546939
bindkey "^[^[OA" up-line-or-beginning-search
bindkey "^[^[OB" down-line-or-beginning-search
bindkey "^[^[OC" forward-char
bindkey "^[^[OD" backward-char

# fnm
export PATH="/Users/landon/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/landon/.bun/_bun" ] && source "/Users/landon/.bun/_bun"

# Eza
alias ls="eza --all --icons --git-ignore"
alias tree="eza --tree --all --icons --git-ignore"

# Zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# thefuck
eval $(thefuck --alias)

# fzf
source <(fzf --zsh)

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/.config/fzf-git.sh/fzf-git.sh
