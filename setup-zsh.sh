#!/bin/bash

# This script installs ZSH, Git, and Curl.
# It is used to set up the development environment for the project.
# ZSH is a powerful shell with additional features and customization options.
# Git is a version control system used for tracking changes in code.
# Curl is a command-line tool used for making HTTP requests.
# Usage: ./setup-zsh.sh

# Install ZSH, Git, and Curl
apt-get update && apt-get install -y curl zsh git fonts-powerline

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Clone necessary plugins and theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Configure .zshrc
echo "ZSH_THEME='powerlevel10k/powerlevel10k'" >> $HOME/.zshrc
echo "source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" >> $HOME/.zshrc
echo "source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc
echo "source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc

# Change default shell to ZSH
chsh -s $(which zsh)