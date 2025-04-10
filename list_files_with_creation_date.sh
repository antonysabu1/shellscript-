#!/bin/bash

directory="/home/student"

if [ -d "$directory" ]; then
    cd "$directory" || exit

    serial_number=1

    files=(*)
    if [ ${#files[@]} -eq 0 ]; then
        echo "⚠️  No files found in $directory."
        exit 0
    fi
    echo "📁 Listing files in: $directory"
    printf "\n%-6s %-40s %-15s\n" "No." "File Name" "Date Created"
    echo "----------------------------------------------------------------------"

    for file in *; do
        if [ -f "$file" ]; then
           
            creation_date=$(stat -c %y "$file" | cut -d' ' -f1)

          
            printf "%-6s %-40s %-15s\n" "$serial_number" "$file" "$creation_date"

            ((serial_number++))
        fi
    done

    echo "----------------------------------------------------------------------"
    echo "✅ Total files listed: $((serial_number - 1))"

else
    echo "❌ Directory '$directory' does not exist."
fi
