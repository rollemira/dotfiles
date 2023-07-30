#!/usr/bin/env zsh

echo "\n<<< setting up homebrew >>>\n"

if exists brew; then
  echo "homebrew exists"
else
  # Install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# This adds all from Brewfile
brew bundle --verbose

# Should we wrap this in a conditional?
echo "Enter superuser (sudo) password to accept Xcode license"
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch


echo "Installing VS Code Extensions"
command cat vscode_extensions | xargs -L 1 code --install-extension


# This works to solve the Insecure Directories issue:
# compaudit | xargs chmod go-w
# But this is from the Homebrew site, though `-R` was needed:
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
chmod -R go-w "$(brew --prefix)/share"
