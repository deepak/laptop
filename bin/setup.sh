#!/usr/bin/env bash

set -euo pipefail
# set -x

STARTTIME=$(date +%s)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source ./lib/osx.sh
source ./lib/ssh.sh
source ./lib/brew.sh
source ./lib/nodejs.sh
source ./lib/asdf.sh
source ./lib/iterm.sh
source ./lib/vscode.sh
source ./lib/vlc.sh
source ./lib/shell.sh

ENDTIME=$(date +%s)
echo "[INFO] setup done in $((ENDTIME - STARTTIME)) seconds"