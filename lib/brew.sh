#!/usr/bin/env bash

realpath() {
  ruby -e "require 'pathname'; puts Pathname.new('$1').realpath"
}

if ! command -v brew >/dev/null; then
  # NOTE: homebrew installs xcode command line tools
  curl -fsS \
    'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

# TODO: run periodically or fail fast if internet roundtrip is slow
# NOTE: using `--force` due to https://github.com/Homebrew/brew/issues/1151
# brew update --force

# NOTE: `brew bundle` might fail,
# can either run it repeatedly or install the individual formula/cask.
# disabled errexit as bundle for `firefox-developer-edition`
# always fails as it is already installed.
# bug in `brew bundle` https://github.com/Homebrew/homebrew-bundle/issues/258
set +o errexit
cat "./configs/Brewfile" | brew bundle --file=-
cat "./configs/Brewfile" | brew bundle cleanup --force --file=-
set -o errexit

brew cleanup
# du -hc  `brew --cache`
# brew doctor
# system_profiler SPFontsDataType | grep 'FiraCode'
# check `brew leaves` for leaf nodes of the dependency graph. can uninstall if not used

# shellcheck disable=SC2046
ln -Fs $(find /usr/local -name "Emacs.app") "$HOME/Applications/Emacs.app"
# shellcheck disable=SC2046
ln -Fs $(realpath './configs/dotfiles/spacemacs/') "$HOME/.emacs.d"
# shellcheck disable=SC2046
ln -Fs $(realpath './configs/dotfiles/.spacemacs') "$HOME/.spacemacs"

echo "[INFO] install xcode command line tools and homebrew"