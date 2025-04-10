#!/bin/bash

line_count=0
word_count=0
char_count=0
stop_word="STOP"

echo "📝 Enter your text line by line (type '$stop_word' to stop):"

while IFS= read -r line; do
    ((line_count++))

    if [[ "$line" =~ $stop_word ]]; then
        break
    fi

    # Word and character counting
    for word in $line; do
        ((word_count++))
    done

    char_count=$((char_count + ${#line}))
done

((line_count--))

echo -e "\n📊 Text Analysis Result:"
echo "📄 Line count      : $line_count"
echo "🔤 Word count      : $word_count"
echo "✏️  Character count : $char_count"
