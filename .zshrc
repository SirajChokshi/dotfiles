export PATH=$HOME/bin:/usr/local/bin:$PATH

### ZSH HOME
export ZSH=$HOME/.dotfiles

### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

### ---- plugins --------------------------------------------
source <(curl -sL init.zshell.dev); zzinit

# syntax highlighting
zi light z-shell/F-Sy-H
# history search
zi light z-shell/H-S-MW
# oh-my-zsh git plugin
zi snippet 'https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh'

### ---- key binds ------------------------------------------
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

### ---- theme ----------------------------------------------
source "$HOME/.dotfiles/themes/spaceship-prompt/spaceship.zsh"

### ---- aliases --------------------------------------------
alias o='open'

### ---- node -----------------------------------------------
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

### ---- optional configs -----------------------------------
if [ -f "$HOME/.dotfiles/configs/.netflix" ]; then
  source $HOME/.dotfiles/configs/.netflix
fi