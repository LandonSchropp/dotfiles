# This function was taken from Jon Ohrt's dotfiles. It binds control-z to swap between foregrounding
# and backgrounding processes. See https://github.com/jonohrt/dotfiles/blob/master/.zshrc.
fancy-control-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

# Add keybindings for fancy-control-z.
zle -N fancy-control-z
bindkey '^Z' fancy-control-z
