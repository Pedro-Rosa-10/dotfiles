#!/bin/bash

# command for printout
echo ""
read -p "Command: " command

# Capture the output
output=$(eval "$command")

# Wrap it on paste.rs
url=$(echo "$output" |& curl --data-binary @- https://paste.rs)

# Display the pastebin URL
echo ""
echo "Pastebin: $url"
echo ""
