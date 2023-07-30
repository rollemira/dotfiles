#!/usr/bin/env zsh

echo "\n<<< setting up zsh >>>\n"

if [[ -v ZSH ]]; then
  echo "oh my zsh exists"
else
  # Install
  /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
