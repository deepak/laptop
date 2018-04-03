#!/usr/bin/env bash

set -euo pipefail

if ! command -v brew >/dev/null; then
  # NOTE: homebrew installs xcode command line tools
  curl -fsS \
    'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

if brew list | grep -Fq brew-cask; then
  brew uninstall --force brew-cask
fi

# TODO: run periodically or fail fast if internet roundtrip is slow
# NOTE: using `--force` due to https://github.com/Homebrew/brew/issues/1151
# brew update --force

# NOTE: `brew bundle` might fail,
# can either run it repeatedly or install the individual formula/cask.
cat "./configs/Brewfile" | brew bundle --file=-
cat "./configs/Brewfile" | brew bundle cleanup --force --file=-

brew cleanup
# du -hc  `brew --cache`
# brew doctor
# system_profiler SPFontsDataType | grep 'FiraCode'

# check `brew leaves` for leaf nodes of the dependency graph. can uninstall if not used

echo "[INFO] install xcode command line tools and homebrew"
