#!/bin/bash

# Check if file and signature are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 filename signaturefile"
    exit 1
fi

FILE="$1"
SIGNATURE="$2"
PUB_KEY="public_key.pem"

# Verify the digital signature
openssl dgst -sha256 -verify "$PUB_KEY" -signature "$SIGNATURE" "$FILE"
VERIFY_STATUS=$?

if [ $VERIFY_STATUS -eq 0 ]; then
    echo "Signature verification SUCCESSFUL."
    # Extract and display the timestamp
    grep "Timestamp:" "$FILE"
else
    echo "Signature verification FAILED."
fi

