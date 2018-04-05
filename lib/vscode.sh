#!/usr/bin/env bash

! osascript -e 'tell application "Visual Studio Code" to quit' &> /dev/null

cp "./configs/vscode/settings.json" "$HOME/Library/Application Support/Code/User/"

echo "[INFO] configure vscode"