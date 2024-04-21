#!/bin/bash

echo "This script merges multiple files into one, adding only unique content."
echo

if [ $# -lt 2 ]; then
    echo "Usage: $0 <output_file> <input_file1> [<input_file2> ...]"
    echo "Example: $0 merged.txt file1.txt file2.txt file3.txt ..."
    exit 1
fi

output_file=$1
shift

if [ -e "$output_file" ]; then
    echo "Output file '$output_file' already exists. Appending unique content..."
else
    echo "Creating new output file: $output_file"
fi

for input_file in "$@"; do
    cat "$input_file" | grep -v -F -x -f "$output_file" >> "$output_file"
done

echo "Files merged into $output_file successfully."