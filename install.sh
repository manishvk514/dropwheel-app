#!/bin/bash
# DropWheel installer — downloads the latest DropWheel, puts it in Applications and opens it.
#   curl -fsSL https://manishvk514.github.io/dropwheel-app/install.sh | bash
# Safe to run again: it replaces an older DropWheel with the latest one.
set -euo pipefail
URL="https://github.com/manishvk514/dropwheel-app/releases/latest/download/DropWheel.zip"

major=$(sw_vers -productVersion | cut -d. -f1)
if [ "$major" -lt 13 ]; then
  echo "DropWheel needs macOS 13 Ventura or later. This Mac has macOS $(sw_vers -productVersion)."
  exit 1
fi

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
echo "Downloading DropWheel…"
curl -fL --progress-bar -o "$TMP/DropWheel.zip" "$URL"
ditto -x -k "$TMP/DropWheel.zip" "$TMP"

DEST=/Applications
if [ ! -w "$DEST" ]; then DEST="$HOME/Applications"; mkdir -p "$DEST"; fi

# Quit a running copy before replacing it.
osascript -e 'tell application id "com.manish.dropwheel" to quit' >/dev/null 2>&1 || true
pkill -x DropWheel 2>/dev/null || true
sleep 1

rm -rf "$DEST/DropWheel.app"
ditto "$TMP/DropWheel.app" "$DEST/DropWheel.app"
# Downloaded with curl, so macOS doesn't mark it as "from the internet"; clear the flag anyway.
xattr -dr com.apple.quarantine "$DEST/DropWheel.app" 2>/dev/null || true
open "$DEST/DropWheel.app"

echo ""
echo "✓ DropWheel is installed in $DEST and running — look for its icon in the menu bar."
echo "  Video, audio and document conversions need free engines:"
echo "  menu bar icon → Engines… → Install Missing  (uses Homebrew: https://brew.sh)"
