#!/usr/bin/env bash

set +o nounset
# shellcheck disable=SC1091
source /usr/local/opt/asdf/asdf.sh
set -o nounset

cat > "$HOME/.profile" <<EOF
source /usr/local/opt/asdf/asdf.sh
export PATH="$(npm bin -g):$PATH"
EOF

! cp /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash /usr/local/etc/bash_completion.d

# NOTE: Terminal.app will crash if there is any mistake here
# in which case, open up `.bash_profile` in vscode
# in the open file dialog, type `cmd + shift + .`` to see hidden files
cat > "$HOME/.bash_profile" <<EOF
source "$HOME/.profile"

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  source /usr/local/share/bash-completion/bash_completion
fi

# TODO: autocomplete does not work for alias
alias gst="git status"
alias gco="git checkout"
alias gcl="git clone"
alias b="brew"
alias l="ls"
alias ll="ls -al"
alias lk="ls -alhS"
EOF
git config --global push.default simple

# this is needed because otherwise Terminal.app will prompt about closing the bash process on close
# TODO: there are two bash process running `ps aux | grep bash` (not sure why).
# but just that Terminal.app does not prompt on close
if ! grep -Fxq '/usr/local/bin/bash' /etc/shells
then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells
fi
# sadly, only this is not sufficient. I only want Terminal.app to run homebrew bash. nothing else.
defaults write com.apple.Terminal Shell -string '/usr/local/bin/bash'
# but without changing the user shell Terminal.app does not pick up on the config changes ¯\_(ツ)_/¯
sudo chsh -s /usr/local/bin/bash "$USER"
# can check that it worked by:
# echo "$SHELL $BASH_VERSION" and "dscl . -read /Users/$USER UserShell"

echo "[INFO] configure shell"