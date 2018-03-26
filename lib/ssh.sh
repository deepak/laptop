#!/usr/bin/env bash

# drwx------
chmod 700 ~/.ssh

cp ./configs/ssh-keys/* ~/.ssh/

# -rw-------
chmod 600 ~/.ssh/id_rsa ~/.ssh/id_ed25519
# -rw-r--r--
chmod 644 ~/.ssh/id_rsa.pub ~/.ssh/id_ed25519.pub

# chmod 644 ~/.ssh/authorized_keys
# chmod 644 ~/.ssh/known_hosts

cat > ~/.ssh/config <<EOF
Host *
  PasswordAuthentication no
  ChallengeResponseAuthentication no
  HashKnownHosts yes
  UseKeychain no
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_rsa

Host github.com
  User git
  PasswordAuthentication no
  ChallengeResponseAuthentication no
  HashKnownHosts yes
  UseKeychain no
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_ed25519
EOF
# -rw-r--r--
chmod 644 ~/.ssh/config

# remove remembered pass from macOS keychain
# CREDIT: https://lobste.rs/s/sounxg/macos_sierra_permanently_remembers_ss
ssh-add -D -K &> /dev/null
for f in ~/Library/Keychains/*/keychain-2.db; do sqlite3 $f "delete from genp where agrp = 'com.apple.ssh.passphrases';"; done

echo "[INFO] configure ssh"