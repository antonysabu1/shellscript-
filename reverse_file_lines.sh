#!/bin/bash

read -p "📄 Enter the file path: " file_path

if [[ ! -f "$file_path" || ! -r "$file_path" ]]; then
    echo "❌ Error: File does not exist or is not readable."
    exit 1
fi

mapfile -t file_lines < "$file_path"

total_lines=${#file_lines[@]}

echo -e "\n🔁 Reversed file content:\n"

for (( i = total_lines - 1; i >= 0; i-- )); do
    echo "${file_lines[i]}"
done
