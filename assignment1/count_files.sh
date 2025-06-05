#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <absolute_directory_path>"
  exit 1
fi

if [ -d "$1" ]; then
  count=$(find "$1" -maxdepth 1 -type f | wc -l)
  echo "There are $count files in directory '$1'."
else
  echo "'$1' is not a valid directory."
fi

