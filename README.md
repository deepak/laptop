# laptop

[![Build Status](https://travis-ci.org/deepak/laptop.svg?branch=master)](https://travis-ci.org/deepak/laptop)

setup script for laptop. works and tested on macOS High Sierra (10.13)

## Setup

1. clone repo and pull in submodules
   ```sh
   git clone git://github.com/deepak/laptop.git
   git submodule update --init --recursive
   ```
   revert to the last known good state, in case there is a problem with the `spacemacs` submodule.
   ```sh
   cd configs/dotfiles/spacemacs
   git checkout c7a103a772d808101d7635ec10f292ab9202d9ee
   ```
2. configure as given below in `configuration needed`
3. run `GIT_USER_NAME=<name> GIT_USER_EMAIL=<email> ./bin/setup.sh` in Terminal.app

## configuration needed:

1. copy your public and private keys to `./configs/ssh-keys`. Using `ed25519` keys for github and `rsa` by default. Generally use `ed25519` whereever possible as it is more secure.
2. set `laptopName` in `osx.sh`

## generate SSH keys

```bash
ssh-keygen -t ed25519 -C $EMAIL -N $SSH_PASSWORD
ssh-keygen -t rsa -b 4096 -C $EMAIL -N $SSH_PASSWORD
```
