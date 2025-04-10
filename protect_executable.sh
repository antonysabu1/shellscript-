#!/bin/bash

read -p "🔐 Enter the name of the executable file to protect: " file

if [ ! -e "$file" ]; then
    echo "❌ Error: File '$file' does not exist."
    exit 1
fi

if [ ! -x "$file" ]; then
    echo "ℹ️  '$file' is already non-executable."
    exit 0
fi

chmod -x "$file"

if [ ! -x "$file" ]; then
    echo "✅ '$file' is now protected (non-executable)."
else
    echo "⚠️  Failed to change execute permission for '$file'."
fi
