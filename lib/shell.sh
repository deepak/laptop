#!/usr/bin/env bash

set +o nounset
# shellcheck disable=SC1091
source /usr/local/opt/asdf/asdf.sh
set -o nounset

cat > "$HOME/.profile" <<EOF
source /usr/local/opt/asdf/asdf.sh
export PATH="$(npm root -g):$PATH"
EOF

! cp /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash /usr/local/etc/bash_completion.d

echo "[INFO] configure shell"