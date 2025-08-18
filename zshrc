# TODO: Currently, Shellcheck can't follow dynamic paths in the source command, even ones with
# relatively simple expansions like $HOME. In order to avoid `Not following` errors repeatedly, I'm
# disabling the check for this file. See https://github.com/koalaman/shellcheck/issues/2710 for a
# feature request to fix this.
# shellcheck disable=SC1090,SC1091

# FIX: tmuxinator mangles the $GEM_HOME environment variable. This is a quick and dirty fix.
# https://github.com/tmuxinator/tmuxinator/issues/841
unset GEM_HOME

# Configure the ZSH cache directory for autocompletion so Zsh doesn't create a bunch of files in the
# home directory.
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Set the Oh My Zsh directory.
export ZSH="$HOME/.oh-my-zsh"

# Oh My Zsh plugins
# shellcheck disable=SC2034
plugins=(
  colored-man-pages
  command-not-found
  httpie
  mise
  rails
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Disable the Oh My Zsh update prompt (always update automatically)
export DISABLE_UPDATE_PROMPT=true

# Source Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# Disable autocorrect
unsetopt correct_all

# Prevent OA from getting typed when hitting <esc><up> in the terminal.
# https://superuser.com/a/1546939
bindkey "^[^[OA" up-line-or-beginning-search
bindkey "^[^[OB" down-line-or-beginning-search
bindkey "^[^[OC" forward-char
bindkey "^[^[OD" backward-char

# Source the configuration files
source "$HOME/.config/zsh/path.zsh"
source "$HOME/.config/zsh/aliases-and-commands.zsh"
source "$HOME/.config/zsh/fancy-control-z.zsh"
source "$HOME/.config/zsh/fzf.zsh"
source "$HOME/.config/zsh/prompt.zsh"
source "$HOME/.config/zsh/tmux.zsh"

for CONFIG_FILE in "$HOME"/.config/zsh/*; do
  source "$CONFIG_FILE"
done
