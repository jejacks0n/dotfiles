#!/bin/sh

echo "📊 Importing iStat Menus Settings..."

ASSET_PATH="$HOME/.local/share/chezmoi/assets"
ISTAT_CONFIG="$ASSET_PATH/istat-menus-settings.ismp7"
if [ -f "$ISTAT_CONFIG" ]; then
  open "$ISTAT_CONFIG"
fi
