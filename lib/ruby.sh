#!/usr/bin/env bash

set +o nounset
# shellcheck disable=SC1091
source /usr/local/opt/asdf/asdf.sh
set -o nounset

! asdf plugin-add ruby

cat > "$HOME/.default-gems" <<EOF
bundler
pry
overcommit
github-linguist
EOF

asdf install ruby 2.5.1
asdf global ruby 2.5.1

gem install bundler pry overcommit github-linguist &> /dev/null

echo "[INFO] install ruby and gems"