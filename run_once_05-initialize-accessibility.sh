#!/bin/sh

echo "🔍 Configuring Accessibility Zoom..."

# We attempt to write the first setting.
if ! defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true 2>/dev/null; then
  echo "⚠️  Permission Denied: Unable to modify Accessibility settings."
  echo "   This script needs Full Disk Access to change accessibility settings."
  echo ""
  echo "   1. System Settings will open automatically."
  echo "   2. Go to Privacy & Security -> Full Disk Access."
  echo "   3. Toggle 'Terminal' (or iTerm/Ghostty) to ON."
  echo "   4. Re-run this script (or 'chezmoi apply')."

  # Open the Privacy & Security pane.
  open "x-apple.systempreferences:com.apple.settings.PrivacySecurity"

  # Exit with failure so the script stops here.
  exit 1
fi

# If we passed the if-check, the first write succeeded and we can safely run the rest.
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 1048576
defaults write com.apple.universalaccess closeViewSmoothImages -bool false
