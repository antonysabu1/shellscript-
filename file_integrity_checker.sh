#!/bin/bash

echo "🔒 File Integrity Check Tool"
echo "📁 Directory: $PWD"

read -p "📄 Enter the name of the file to check: " file

calculate_hash() {
    sha256sum "$1" | awk '{print $1}'
}

if [ ! -f "$file" ]; then
    echo "❌ File '$file' does not exist in $PWD"
    exit 1
fi

original_hash=$(calculate_hash "$file")
echo "✅ Original SHA-256 hash: $original_hash"

read -p "🛠️  Make changes to the file and press Enter when you're done..."

new_hash=$(calculate_hash "$file")
echo "🔁 New SHA-256 hash: $new_hash"

if [ "$original_hash" == "$new_hash" ]; then
    echo "✅ File integrity is intact (no changes detected)."
else
    echo "⚠️  File has been modified (hash mismatch)."
fi
