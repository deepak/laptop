#!/usr/bin/env bash

# get the welcome screen out of the way
defaults write org.m0k.transmission WarningLegal -bool false

# configure UI
defaults write org.m0k.transmission SortByGroup -bool true
defaults write org.m0k.transmission FilterBar -bool true
defaults write org.m0k.transmission FilterSearchType -string 'Name'
defaults delete org.m0k.transmission Filter
defaults delete org.m0k.transmission FilterGroup

# configure download location
defaults write org.m0k.transmission DownloadFolder -string "$HOME/Documents/Torrents/done"
defaults write org.m0k.transmission IncompleteDownloadFolder -string "$HOME/Documents/Torrents/incomplete"
defaults write org.m0k.transmission NSNavLastRootDirectory -string "$HOME/Documents/Torrents/incomplete"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true

# do not append `.part` to incomplete files
defaults write org.m0k.transmission RenamePartialFiles -bool false

# security
# TODO: may be better to self-host using https
# https://gist.github.com/johntyree/3331662
# https://github.com/cinus/iblocklist/blob/master/get_lists.sh
defaults write org.m0k.transmission BlocklistURL -string "https://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission RandomPort -bool true

# TODO: associate magnet urls with org.m0k.transmission