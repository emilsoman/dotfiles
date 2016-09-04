echo "Loading ~/.zshrc"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fletcherm"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx lein per-directory-history vundle extract)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
source $HOME/.zsh_theme

# Customize to your needs...
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH=$PATH:$HOME/Tools/bin # Add custom tools bin

source ~/.nvm/nvm.sh # Use NVM for node version management
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
PATH=$PATH:/Users/emil/Tools/ADT-bundle/sdk/platform-tools:/Users/emil/Tools/ADT-bundle/sdk/tools

source ~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh

# To use Direnv with zsh
eval "$(direnv hook zsh)"

# For Go
#export GOPATH=$HOME/golang
export GOPATH=/Users/emil/Workspace/go
#export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
