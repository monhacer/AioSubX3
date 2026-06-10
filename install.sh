#!/usr/bin/env bash

set -e

INSTALL_DIR="/etc/x-ui/sub"
INSTALL_FILE="$INSTALL_DIR/sub.html"
SOURCE_URL="https://raw.githubusercontent.com/monhacer/AioSubX3/main/sub.html"

echo "Installing / Updating AioSubX3..."

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  echo "Example:"
  echo "sudo bash install.sh"
  exit 1
fi

mkdir -p "$INSTALL_DIR"

if [ -f "$INSTALL_FILE" ]; then
  echo "Removing old sub.html..."
  rm -f "$INSTALL_FILE"
fi

echo "Downloading latest AioSubX3..."
curl -fsSL "$SOURCE_URL" -o "$INSTALL_FILE"

chmod 644 "$INSTALL_FILE"

echo "AioSubX3 installed/updated successfully."
echo "File path: $INSTALL_FILE"
