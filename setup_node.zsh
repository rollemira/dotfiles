#!/usr/bin/env zsh

echo "\n<<< setting up node >>>\n"

if exists node; then
  echo "node exists"
else
  # Dig out nvm
  . "$NVM_DIR/nvm.sh"
  nvm install lts
fi

if exists yarn; then
  echo "yarn exists"
else
  npm i -g yarn
fi