#!/bin/bash

directory="$HOME/class/batch"
file_name="new_file.txt"

if [ ! -d "$directory" ]; then
    echo "📁 Directory does not exist. Creating: $directory"
    mkdir -p "$directory"
else
    echo "✅ Directory exists: $directory"
fi

# Change to the directory
cd "$directory" || {
    echo "❌ Failed to change to directory: $directory"
    exit 1
}

if touch "$file_name"; then
    echo "📝 File '$file_name' successfully created in $directory"
else
    echo "❌ Failed to create file '$file_name'"
fi
