#!/usr/bin/env bash

! osascript -e 'tell application "Visual Studio Code" to quit' &> /dev/null

defaultHtmlSnippets="$HOME/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/html/snippets/html.snippets.json"

# TODO: hide sidebar
cp "./configs/vscode/settings.json" "$HOME/Library/Application Support/Code/User/"
cp "./configs/vscode/snippets/html.json" "$HOME/Library/Application Support/Code/User/snippets"
# cannot override default snippets https://github.com/Microsoft/vscode/issues/10565, so we hack it
jq 'del(."HTML template")' "$defaultHtmlSnippets" | sponge "$defaultHtmlSnippets"

# NOTE: search for extensions like `@sort:installs ext:css lint`
# general
code --install-extension christian-kohler.path-intellisense

# html/css
code --install-extension bierner.color-info
code --install-extension kamikillerto.vscode-colorize
code --install-extension mkaufman.htmlhint
code --install-extension JakeWilson.vscode-placeholder-images
code --install-extension pranaygp.vscode-css-peek
code --install-extension kisstkondoros.csstriggers

# javascript
code --install-extension wix.vscode-import-cost

# bash
code --install-extension timonwong.shellcheck

# misc
code --install-extension pnp.polacode
code --install-extension tootone.org-mode
code --install-extension bungcip.better-toml
code --install-extension lamartire.git-indicators
# code --install-extension letrieu.expand-region

unset defaultHtmlSnippets
echo "[INFO] configure vscode"