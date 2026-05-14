#!/bin/bash

FILE="$1"

if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

echo "Getting GoFile server..."

RESPONSE=$(curl -s https://api.gofile.io/servers)

# DEBUG kalau error
echo "$RESPONSE" | head

SERVER=$(echo "$RESPONSE" | jq -r '.data.servers[0].name // empty')

if [ -z "$SERVER" ]; then
  echo "ERROR: Failed to get GoFile server"
  exit 1
fi

echo "Using server: $SERVER"

UPLOAD=$(curl -s -F "file=@$FILE" "https://${SERVER}.gofile.io/uploadFile")

echo "$UPLOAD"

LINK=$(echo "$UPLOAD" | jq -r '.data.downloadPage // empty')

if [ -z "$LINK" ]; then
  echo "Upload failed or invalid response"
  exit 1
fi

echo "Download link: $LINK"
