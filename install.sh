#!/usr/bin/env bash

INSTALL_DIR="/etc/x-ui/sub"
INSTALL_FILE="$INSTALL_DIR/sub.html"
SOURCE_URL="https://raw.githubusercontent.com/monhacer/AioSubX3/main/sub.html"

echo "Installing / Updating AioSubX3..."

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

mkdir -p "$INSTALL_DIR"
chmod 755 "$INSTALL_DIR"

rm -f "$INSTALL_FILE"

echo "Downloading..."
wget -O "$INSTALL_FILE" "$SOURCE_URL"

if [ -f "$INSTALL_FILE" ]; then
  chmod 644 "$INSTALL_FILE"
  echo "Success: $INSTALL_FILE"
  ls -la "$INSTALL_FILE"
else
  echo "Failed!"
  exit 1
fi
