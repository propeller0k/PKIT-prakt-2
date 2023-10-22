#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <directory> <original_extension> <new_extension>"
  exit 1
fi

directory=$1
original_extension=$2
new_extension=$3

if [ ! -d "$directory" ]; then
  echo "Папка $directory не знайдена!"
  exit 1
fi

for file in "$directory"/*."$original_extension"; do
  if [ -e "$file" ]; then
    filename=$(basename "$file")
    new_filename="${filename%.$original_extension}"
    new_filename="$new_filename.$new_extension"
    mv "$file" "$directory/$new_filename"
    echo "Перейменовую $filename на $new_filename"
  fi
done
