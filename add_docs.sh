#!/bin/bash
find . -type f -name "*.dart" -print0 | while IFS= read -r -d $'\0' file;
do
    # Add documentation to public classes
    sed -i -E ':a;N;$!ba;s/([^\n])(\n)(class [A-Z][a-zA-Z0-9_]*)/\1\n/// Description of the class.\n\3/g' "$file"

    # Add documentation to public functions
    sed -i -E ':a;N;$!ba;s/([^\n])(\n)([A-Za-z_][A-Za-z0-9_]* [a-z][a-zA-Z0-9_]*\([^)]*\) {)/\1\n/// Description of the function.\n\3/g' "$file"

    # Add documentation to public variables
    sed -i -E ':a;N;$!ba;s/([^\n])(\n)(final [A-Za-z_][A-Za-z0-9_]* [a-z][a-zA-Z0-9_]*;)/\1\n/// Description of the variable.\n\3/g' "$file"
done
