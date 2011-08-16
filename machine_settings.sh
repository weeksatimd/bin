# itunes_reverse
defaults write com.apple.iTunes invertStoreLinks -bool YES
# itunes_nogenre
defaults write com.apple.iTunes show-genre-when-browsing -bool FALSE
# itunes_nobackup
defaults write com.apple.iTunes AutomaticDeviceBackupsDisabled -bool true
# itunes_no_funky_iTunes10_window
defaults write com.apple.iTunes full-window -bool YES
# exp_print
defaults write /Library/Preferences/.GlobalPreferences PMPrintingExpandedStateForPrint -bool TRUE
# exp_save
defaults write /Library/Preferences/.GlobalPreferences NSNavPanelExpandedStateForSaveMode -string 1
# def_fastscripts
defaults write com.red-sweater.FastScripts ScriptTreePathsKey '("FSSP%%%$HOME$/Library/Scripts")'
# ical_default_aptlength
defaults write com.apple.iCal 'Default duration in minutes for new event' 0
# Remove Spotlight menu item (must quit SystemUIServer after doing this) - http://snurl.com/rpbat
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search; killall SystemUIServer
# dock_gridlist
# defaults write com.apple.dock use-new-list-stack -bool YES;killall Dock
# Load script to update iChat status with latest Twitter post
launchctl load ~/Library/LaunchAgents/com.liketribe.twitterstatus.plist
# Change the way Mail.app Copy Address function works
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool NO
# Delete the Microsoft Office License
rm ~/Library/Preferences/Microsoft/Office\ 2008/Microsoft\ Office\ 2008\ Settings.plist 
rm /Applications/Microsoft\ Office\ 2008/Office/OfficePID.plist
# add this line to /etc/hosts to block Tynt which appends junk when you copy and paste from some websites
# 127.0.0.1   tcr.tynt.com
# make witch window open on screen that has the mouse
~/Library/Application\ Support/Witch/Settings "Appear On Mouse Screen" -bool TRUE
# Set SimpleText folder location for WriteRoom syncing
defaults write com.hogbaysoftware.SimpleText SyncedDocumentsPathKey "/Users/weeks/Dropbox/SimpleText"
# Reset Flash plugin in Safari
killall -9 WebKitPluginHost
# Restart Menu Bar
killall -KILL SystemUIServer
# Restart Dock
killall -KILL Dock
# Restart Finder
killall -KILL Finder
# Opensnoop is my new favorite utility. It uses DTrace to show you all of the files that are being accessed on your system, you need to execute it with superuser privileges
sudo opensnoop
# You can also watch what a particular process opens by passing in the PID:
sudo opensnoop -p PID
# Or watch a particular file to see who's opening it
sudo opensnoop -f /etc/passwd
# Homebrew
ruby -e "$(curl -fsSL https://gist.github.com/raw/323731/install_homebrew.rb)"
# Enable remote disk on a non-Air
defaults write com.apple.NetworkBrowser EnableODiskBrowsing -bool true
defaults write com.apple.NetworkBrowser ODSSupported -bool true
# Show files in your home directory that you don't have read permission for
cd find . \! -perm -0400 -ls | more
# Change Lion default hiding ~/Library
chflags nohidden ~/Library
