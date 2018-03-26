#!/usr/bin/env bash

set -euo pipefail

if ! command -v brew >/dev/null; then
  # homebrew installs xcode command line tools
  curl -fsS \
    'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

if brew list | grep -Fq brew-cask; then
  brew uninstall --force brew-cask
fi

# TODO: run periodically or fail fast if internet roundtrip is slow
# brew update --force # https://github.com/Homebrew/brew/issues/1151

# BUG: not in Brewfile as `brew bundle cleanup` cleans up the fonts!
brew tap caskroom/fonts
brew cask install font-fira-code
# system_profiler SPFontsDataType | grep 'FiraCode'

cat "./configs/Brewfile" | brew bundle --file=-
cat "./configs/Brewfile" | brew bundle cleanup --force --file=-
brew cleanup
# du -hc  `brew --cache`
# brew doctor

echo "[INFO] install xcode command line tools and homebrew"
