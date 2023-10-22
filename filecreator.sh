#!/bin/bash

last_number=$(ls -1 | grep -E "^Andrew[0-9]+" | awk -F'[^0-9]+' '{print $2}' | sort -n | tail -n 1)

if [ -z "$last_number" ]; then
  last_number=0
fi

for ((i=1; i<=25; i++)); do
  next_number=$((last_number + i))
  touch "Andrew$next_number"
done
