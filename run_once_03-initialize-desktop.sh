#!/bin/sh

echo "🖥️ Initializing Desktop..."

ASSET_PATH="$HOME/.local/share/chezmoi/assets"

# Show drives and mounted servers on the desktop.
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Set a random wallpaper.
WALLPAPER_DIR="$ASSET_PATH/wallpaper"
if [ -d "$WALLPAPER_DIR" ]; then
  echo "   Setting random wallpaper..."

  # We use 'find' to get images, and a quick perl one-liner to shuffle them
  # (standard macOS 'sort' doesn't support random sorting)
  RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.heic" \) \
                     | perl -MList::Util=shuffle -e 'print shuffle <>' \
                     | head -n 1)

  if [ -n "$RANDOM_WALLPAPER" ]; then
    osascript -e "tell application \"System Events\" to set picture of every desktop to \"$RANDOM_WALLPAPER\""
  fi
fi

echo "   Setting desktop icon size and spacing..."

# Helper function to update nested Finder settings safely
# Usage: SetDesktopSetting "KeyName" "Integer_Value"
SetDesktopSetting() {
  local key="$1"
  local value="$2"
  local plist="$HOME/Library/Preferences/com.apple.finder.plist"

  # Try to SET the value (works if the key exists)
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:$key $value" "$plist" 2>/dev/null

  # If SET failed (key didn't exist), ADD it instead
  if [ $? -ne 0 ]; then
    /usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings:$key integer $value" "$plist"
  fi
}

SetDesktopSetting "iconSize" 128
SetDesktopSetting "gridSpacing" 50
#SetDesktopSetting "textSize" 16
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null

echo "   You'll need to set the icon yourself: $ASSET_PATH/drive-icon.png"
