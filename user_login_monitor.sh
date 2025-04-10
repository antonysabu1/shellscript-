#!/bin/bash

read -p "👤 Enter the username to monitor: " username

read -p "⏳ Enter how many minutes to monitor (or press Enter to run infinitely): " duration
duration_seconds=$((duration * 60))

start_time=$(date +%s)

echo "📡 Monitoring login status of user '$username'..."

while true; do
    current_time=$(date +%s)

    if [[ -n "$duration" && $((current_time - start_time)) -ge $duration_seconds ]]; then
        echo "✅ Monitoring finished after $duration minute(s)."
        break
    fi

    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    if who | grep -qw "$username"; then
        echo "[$timestamp] ✅ User '$username' is logged in."
    else
        echo "[$timestamp] ❌ User '$username' is not logged in."
    fi

    sleep 30
done
