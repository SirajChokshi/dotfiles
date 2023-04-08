#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

export PATH=$HOME/bin:/usr/local/bin:$PATH

### ZSH HOME
export ZSH=$HOME/.dotfiles

### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.g
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

### ---- plugins --------------------------------------------
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-history-substring-search"

### ---- prompt ---------------------------------------------
eval "$(starship init zsh)"

### ---- key binds ------------------------------------------
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

### ---- aliases --------------------------------------------
source "$HOME/.dotfiles/aliases.zsh"

### ---- node -----------------------------------------------

# if [ -f "$HOME/.nvm/nvm.sh" ]; then
  # nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# else if [ -f "$HOME/.fnm/fnm.sh" ]; then
#   # fnm
#   export PATH="/Users/schokshi/Library/Application Support/fnm:$PATH"
#   eval "`fnm env`"
# fi

### ---- optional configs -----------------------------------
if [ -f "$HOME/.dotfiles/configs/.netflix" ]; then
  source $HOME/.dotfiles/configs/.netflix
fi

alias python=/usr/bin/python3
alias pip=/usr/bin/pip3
