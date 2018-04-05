#!/usr/bin/env bash

set +o nounset
# shellcheck disable=SC1091
source /usr/local/opt/asdf/asdf.sh
set -o nounset

asdf plugin-update --all

cat > "$HOME/.asdfrc" <<EOF
legacy_version_file = yes
EOF

# cat > "$HOME/.tool-versions" <<EOF
# nodejs 8.11.1
# ruby 2.5.1
# EOF

echo "[INFO] configure asdf"