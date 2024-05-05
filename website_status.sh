#!/bin/bash

urls=('https://www.google.com' 'https://www.facebook.com' 'https://www.twitter.com')

log_file='./website_status.log'


# Function to log messages
log_message() {
    echo "$1"
    echo "$1" >> "$log_file"
}

rm -rf "$log_file"

for url in "${urls[@]}"; do
    if curl -s -L --head --request GET "$url" 2>/dev/null | grep -q "HTTP/.* 200"; then
        log_message "$url is UP"
    else
        log_message "$url is DOWN"
    fi
done

log_message "Results are in a log file: $log_file"
