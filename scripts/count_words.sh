#!/bin/bash
current_file_path="$(realpath "$0")"
echo "$current_file_path"
# Function to count words in a markdown file and append the result to GitHub step summary
count_words() {
  local file=$1
  local count
  count=$(wc -w < "$file")
  echo "$file: $count words"
  echo "$file: $count words" >> $GITHUB_STEP_SUMMARY
}

# Find all markdown files and count words
echo "Counting words in markdown files..."
find . -type f -name "*.md" | while read -r markdown_file; do
  count_words "$markdown_file"
done
