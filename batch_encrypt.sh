#!/bin/bash

PUB_KEY="public_key.pem"

for file in *.txt; do
    openssl rsautl -encrypt -pubin -inkey $PUB_KEY -in "$file" -out "$file.encrypted"
done

