#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

if [ -f "$1" ]; then
  echo "File '$1' exists."
else
  echo "File '$1' does not exist."
fi
