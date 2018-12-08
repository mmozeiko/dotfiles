#!/bin/sh

response=$(curl -L -s -w "\n%{http_code}\n" "https://www.bitstamp.net/api/v2/ticker/ethusd/")
code=$(echo "$response" | sed -n '$p')
res=$(echo "$response" | sed '$d')

case "$code" in
  200) echo "$res" | jq -r ".last" | awk '{printf "%.2f", $1}'
       ;;
    *) echo -e "??"
       exit 1
       ;;
esac
