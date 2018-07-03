# Symbolically link the system dictionary to the vim spellfile
mkdir -p $HOME/Library/Spelling
mkdir -p $HOME/.config/nvim/spelling
ln -sf $HOME/Dropbox/Mackup/Spelling/LocalDictionary $HOME/Library/Spelling/LocalDictionary
ln -sf $HOME/Dropbox/Mackup/Spelling/LocalDictionary $HOME/.config/nvim/spelling/en.utf-8.add
