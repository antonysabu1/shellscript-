#!/bin/bash

read -p "📁 Enter the directory path: " directory

if [ -d "$directory" ]; then
    echo "✅ Directory exists: $directory"

    read -p "🔍 Enter a file extension to filter by (e.g., txt), or press Enter to list all files: " ext

  
    read -p "💾 Do you want to save the output to a file? (y/n): " save_output

    
    if [ -z "$ext" ]; then
        file_list=$(ls -lhA "$directory")
    else
        file_list=$(find "$directory" -maxdepth 1 -type f -iname "*.$ext" -exec ls -lh {} +)
    fi

    if [ -z "$file_list" ]; then
        echo "⚠️  No files found with the given criteria."
    else
        echo -e "\n📄 Files in $directory:"
        echo "$file_list"
        
        if [[ "$save_output" =~ ^[Yy]$ ]]; then
            output_file="file_list_output.txt"
            echo "$file_list" > "$output_file"
            echo "💾 Output saved to $output_file"
        fi
    fi
else
    echo "❌ Directory '$directory' does not exist."
fi
