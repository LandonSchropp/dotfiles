# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/tgeorge/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel9k/powerlevel9k"


# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git salesforce-cli-zsh-completion
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Sublime text
export PATH=./node_modules/:$PATH
export EDITOR='nvim'

#direnv
eval "$(direnv hook zsh)"

# ls alias
alias ls='ls -a'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tgeorge/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tgeorge/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tgeorge/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tgeorge/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# ruby version init command
eval "$(rbenv init -)"

# Allow current dir's bin to be in path.
export PATH="./bin:$PATH"

# Go
export PATH="$PATH:/Users/tgeorge/go/bin"
export GOPATH="/Users/tgeorge/go"

# Tesla project shortcuts
alias @tesla='cd /Users/tgeorge/Documents/Projects/tesla'
alias @adapter='cd /Users/tgeorge/Documents/Projects/tesla/projects/tesla-adapter'
alias @data-point='cd /Users/tgeorge/Documents/Projects/tesla/projects/tesla-data-point'
alias @deployment='cd /Users/tgeorge/Documents/Projects/tesla/projects/tesla-deployment'
alias @permission='cd /Users/tgeorge/Documents/Projects/tesla/projects/tesla-permission'
alias @proxy='cd /Users/tgeorge/Documents/Projects/tesla/projects/tesla-proxy'
alias @site='cd /Users/tgeorge/Documents/Projects/tesla/projects/tesla-site'
alias @ui='cd /Users/tgeorge/Documents/Projects/tesla/projects/tesla-ui'
alias @weather='cd /Users/tgeorge/Documents/Projects/tesla/projects/tesla-weather'

#docker aliases
alias dcb='docker-compose build'
alias dcr='docker-compose run --rm'
alias dc='docker-compose'
alias dc-nuke='echo "docker-compose down -v --rmi all --remove-orphans" && docker-compose down -v --rmi all --remove-orphans'

# Current alias to authorize gcloud locally for dev kubernetes project.
alias kubeauthdev="gcloud container clusters get-credentials tesla-development --zone us-west1-a --project oe-tesla-development"
