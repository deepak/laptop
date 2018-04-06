#!/usr/bin/env bash

set +o nounset
# shellcheck disable=SC1091
source /usr/local/opt/asdf/asdf.sh
set -o nounset

! asdf plugin-add nodejs
# shellcheck disable=SC1091
source /usr/local/opt/asdf/plugins/nodejs/bin/import-release-team-keyring

# BUG: fails sometimes so install manually anyways!
cat > "$HOME/.default-npm-packages" <<EOF
express
htmlhint
EOF

asdf install nodejs 8.11.1
asdf global nodejs 8.11.1
# asdf reshim nodejs 8.11.1

npm install npm@latest -g &> /dev/null
npm install -g express htmlhint &> /dev/null

echo "[INFO] install nodejs and packages"