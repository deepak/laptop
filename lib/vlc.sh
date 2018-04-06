#!/usr/bin/env bash

# get the welcome screen out of the way
defaults write org.videolan.vlc SUHasLaunchedBefore -bool true
defaults write org.videolan.vlc SUSendProfileInfo -bool false
defaults write org.videolan.vlc SUEnableAutomaticChecks -bool true

# clear vlc history
defaults write org.videolan.vlc NSRecentDocumentsLimit -int 0
defaults delete org.videolan.vlc recentlyPlayedMedia
defaults delete org.videolan.vlc recentlyPlayedMediaList

# open mp4 files in vlc
duti -s org.videolan.vlc .mp4 all