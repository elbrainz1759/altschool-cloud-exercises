#!/bin/bash

for dir in exercise*; do
  # Extract number from the folder name
  num=${dir#exercise}
  
  # Pad the number with leading zero if needed
  padded=$(printf "%02d" "$num")

  # New folder name
  new_name="exercise${padded}"

  # Rename only if name changes
  if [ "$dir" != "$new_name" ]; then
    mv "$dir" "$new_name"
    echo "Renamed $dir → $new_name"
  fi
done
