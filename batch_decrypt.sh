#!/bin/bash

PRIV_KEY="private_key.pem"

for file in *.encrypted; do
    openssl rsautl -decrypt -inkey $PRIV_KEY -in "$file" -out "${file%.encrypted}.decrypted.txt"
done

