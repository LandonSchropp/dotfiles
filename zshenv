# Import the Prezto runtime commands.
source $HOME/.zprezto/runcoms/zshenv

# Disable automatically setting the title.
export DISABLE_AUTO_TITLE="true"

# Set the default text editor
export EDITOR="nvim"

# Add the local bin paths to the system path.
export PATH="./bin:./node_modules/.bin:$PATH"

# Add my custom bin scripts to the system path.
export PATH="$HOME/.dotfiles/bin:$HOME/.dotfiles/bin/gcloud:$HOME/.dotfiles/bin/docker:$PATH"
