# @author: @sirajchokshi <19193347+SirajChokshi@users.noreply.github.com>
# @description: Installation script for all programs on a new machine.
#               There are checks in place to skip installation if the
#               program is already installed. This script is idempotent.

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # deal with symlinks
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # resolve relative symlink
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

## ! We can't change directories in a script, so we have to use the full path
## ! to the dotfiles directory from here on out.

#### ---- System ------------------------------------------------

# Xcode Command Line Tools

if xcode-select -p &> /dev/null; then
    echo "Xcode Command Line Tools found. Skipping installation..."
else
    echo "Xcode Command Line Tools not found. Installing..."
    echo "You will be prompted for your password (and this might take a while)."
    xcode-select --install
fi

# Plugin Manager (Zap <https://www.zapzsh.org/)
if [ -f "$HOME/.local/share/zap/zap.zsh" ]; then
    echo "Zap found. Skipping installation..."
else
    echo "Zap not found. Installing..."
    echo "You will be prompted for your password (and this might take a while)."
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
fi

# Prompt
curl -sS https://starship.rs/install.sh | sh
starship preset nerd-font-symbols > ~/.config/starship.toml


## Symlinks

# Link zshrc
if [ -f "~/.zshrc" || -L "~/.zshrc" ] 
then
    echo ".zshrc found. Skipping symlink..." 
else
    echo ".zshrc not found. Creating symlink..."
    ln -s "${DIR}/.zshrc" ~/.zshrc
fi

# Link global gitignore
if [ -f "~/.gitignore_global"  || -L "~/.gitignore_global" ] 
then
    echo ".gitignore_global found. Skipping symlink..." 
else
    echo ".gitignore_global not found. Creating symlink..."
    ln -s "${DIR}/.gitignore_global" ~/.gitignore_global
fi

# Link gitconfig
if [ -f "~/.gitconfig" || -L "~/.gitconfig" ]
then
    echo ".gitconfig found. Skipping symlink..." 
else
    echo ".gitconfig not found. Creating symlink..."
    ln -s "${DIR}/.gitconfig" ~/.gitconfig
fi

# Homebrew

if brew --version &> /dev/null; then
    echo "Homebrew found. Skipping installation..."
else
    echo "Homebrew not found. Installing..."
    echo "You will be prompted for your password (and this will take a while)."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#### ---- Programs ----------------------------------------------

# Development
brew install nginx

# General (Rosetta)
softwareupdate --install-rosetta

#### ---- Languages ---------------------------------------------

## Node
brew install fnm
echo '"$(fnm env --use-on-cd)"' >> ~/.zprofile
fnm install 18
brew install pnpm

# use ni with pnpm as the default
pnpm i -g @antfu/ni
echo "defaultAgent=pnpm # default \"prompt\"\nglobalAgent=pnpm\n" >> ~/.nirc

# Python 3
echo "alias python=/usr/bin/python3" >> ~/.zshrc
echo "alias pip=/usr/bin/pip3" >> ~/.zshrc

# Go
brew install go

# TODO - add fnm as an option


# Node


#### ---- Applications ------------------------------------------

# Terminal
brew install --cask iterm2

# Utilities
brew install --cask rectangle
brew install --cask raycast
brew install --cask cleanshot

# Development
brew install --cask visual-studio-code
brew install --cask google-chrome

# Communication
brew install --cask slack