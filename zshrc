# FIX: tmuxinator mangles the $GEM_HOME environment variable. This is a quick and dirty fix.
# https://github.com/tmuxinator/tmuxinator/issues/841
unset GEM_HOME

# Configure the ZSH cache directory for autocompletion so Zsh doesn't create a bunch of files in the
# home directory.
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

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
  ruby
  tmux
  yarn
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Disable autocorrect
unsetopt correct_all

# Prevent OA from getting typed when hitting <esc><up> in the terminal.
# https://superuser.com/a/1546939
bindkey "^[^[OA" up-line-or-beginning-search
bindkey "^[^[OB" down-line-or-beginning-search
bindkey "^[^[OC" forward-char
bindkey "^[^[OD" backward-char

# Source the configuration files
for CONFIG_FILE in $HOME/.config/zsh/*; do
  source $CONFIG_FILE
done
