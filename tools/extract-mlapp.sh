#!/bin/bash
set -e

# Extract .mlapp files into folder next to them, with the same name, OVERWRITING
# Meant to be used in a precommit hook
# Call with location of folder to scan recursively, i.e.:
#   ./tools/extract-mlapp src

root="$1"
IFS='
'
for file in $(find "$root" -regex '.*\.mlapp'); do
  dirname="$(dirname -- "$file")"
  basename="$(basename -- "$file")"
  filename="${basename%.*}"
  mkdir -p "$dirname/$filename"
  unzip -o "$file" -d "$dirname/$filename"
done

