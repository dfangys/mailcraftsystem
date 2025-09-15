#!/bin/bash
find . -type f -name "*.dart" -print0 | while IFS= read -r -d $'\0' file;
do
    if [ -s "$file" ] && [ "$(tail -c1 "$file")" != '' ]; then
        echo >> "$file"
    fi
done

