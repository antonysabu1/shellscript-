#!/bin/bash

proc=$(ps aux | grep -E "bash\s" | grep -v grep | wc -l)

if [[ $proc -gt 3 ]]; then
    echo "✅ Running Bash shell scripts exist ($proc found)."
else
    echo "❌ No significant Bash shell scripts are currently running. ($proc found)"
fi
