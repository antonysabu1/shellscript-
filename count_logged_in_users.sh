#!/bin/bash
user_count=$(who | wc -l)
unique_users=$(who | awk '{print $1}' | sort | uniq)

echo "👥 Number of users currently logged in: $user_count"
echo "🧑‍💻 Unique users:"
echo "$unique_users"
