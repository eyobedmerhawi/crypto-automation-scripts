#!/bin/bash

# Check if a file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

FILE="$1"
SIGNED_FILE="${FILE}.signed"
PRIV_KEY="private_key.pem"

# Append current timestamp to the file
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "Timestamp: $TIMESTAMP" >> "$FILE"

# Create digital signature using private key
openssl dgst -sha256 -sign "$PRIV_KEY" -out "$SIGNED_FILE" "$FILE"

echo "File '$FILE' signed as '$SIGNED_FILE' with timestamp: $TIMESTAMP"

