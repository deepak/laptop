#!/usr/bin/env bash

# close preferences app, so that settings are not concurrently modified
osascript -e 'tell application "System Preferences" to quit'

# to see all the domains: `defaults domains | tr "," "\n" | tail -n +2 | uniq | sort | less`
# and to read all the keys of a domaim: `defaults read com.apple.dock`

# set computer name

laptopName="chikki"
sudo scutil --set HostName $laptopName
sudo scutil --set LocalHostName $laptopName
sudo scutil --set ComputerName $laptopName
echo "[INFO] computer name and host name is '$laptopName'"

# configure Dock

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string 'left'
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock largesize -int 72
defaults write com.apple.dock magnification -bool true

# remove and add persistent app to dock in required order
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Launchpad.app/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Safari.app/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Notes.app/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/App%20Store.app/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/System%20Preferences.app/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/Utilities/Activity%20Monitor.app/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'

killall Dock
echo "[INFO] dock is configured"

# set power savings

# original settings
# pmset -g custom
# Battery Power:
#  lidwake              1
#  autopoweroff         1
#  autopoweroffdelay    28800
#  standbydelay         10800
#  standby              1
#  ttyskeepawake        1
#  hibernatemode        3
#  powernap             0
#  gpuswitch            2
#  hibernatefile        /var/vm/sleepimage
#  displaysleep         2
#  sleep                1
#  acwake               0
#  halfdim              1
#  lessbright           1
#  disksleep            10
# AC Power:
#  lidwake              1
#  autopoweroff         1
#  autopoweroffdelay    28800
#  standbydelay         10800
#  standby              1
#  ttyskeepawake        1
#  hibernatemode        3
#  powernap             1
#  gpuswitch            2
#  hibernatefile        /var/vm/sleepimage
#  displaysleep         10
#  womp                 1
#  networkoversleep     0
#  sleep                1
#  acwake               0
#  halfdim              1
#  disksleep            10

# powernap: laptop can check for email, icloud udpates etc while sleeping. do not need
sudo pmset -a powernap 0
echo "[INFO] powernap turned off for all profiles"

# enable firewall

sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on &> /dev/null
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on &> /dev/null
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on &> /dev/null
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on &> /dev/null
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp on &> /dev/null
sudo pkill -HUP socketfilterfw
echo "[INFO] switch on firewall and enable stealth mode and allow access to signed apps"

# check for System Integrity Protection

sipStatus=$(csrutil status)
if [[ $sipStatus = *"System Integrity Protection status: enabled"* ]]; then
  echo "[INFO] SIP is enabled"
else
  echo "[WARN] SIP not enabled"
fi
unset sipStatus

# disable macOS analytics

defaults write "/Library/Application Support/CrashReporter/DiagnosticMessagesHistory.plist" AutoSubmit -bool false
defaults write "/Library/Application Support/CrashReporter/DiagnosticMessagesHistory.plist" ThirdPartyDataSubmit -bool false

unset laptopName
echo "[INFO] disable macOS analytics"

# configure macOS Finder.app

# Finder.app does not read config, even after restart
# defaults write com.apple.finder WindowState.ShowSidebar -bool false && killall Finder
# so write the whole config ?
