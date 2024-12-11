#!/usr/bin/env zsh
#
# Directory Structure Generator v1.0
#
# Author:
# Name: Marco Steinbrecher
# Email: dsgscript@steinbrecher.co
# GitHub: https://github.com/macsteini/directory-structure-generator
#
# Description:
# This script generates a Markdown file named "structure.md" that details
# the folder and file hierarchy of the directory where it is executed.
# It intelligently excludes itself and the generated output file from the
# structure. Ideal for documenting project directories and file collections.
#
# Features:
# - Recursively scans directories and files from the script’s location.
# - Outputs a well-formatted Markdown file with:
#   - Folder icons (**📂**) for directories
#   - File icons (**📄**) for files
# - Dynamically adjusts indentation for nested directories
# - Automatically excludes the script file and the generated output file
#
# Example Usage:
# - Run the script in the desired directory:
#   ./directory-structure-generator.zsh
# - The resulting "structure.md" file will list the hierarchy of files and folders
#
# MIT Licence:
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Check if the script is executed as a command in the shell or from a script file
if [[ "$0" == "-bash" || "$0" == "-zsh" ]]; then
    echo "Executed as a command in the shell."
    SCRIPT_NAME="" # No specific script file to exclude in this case
else
    SCRIPT_NAME="$(basename "$0")" # Get the script's file name
    echo "Executed from a script file: $SCRIPT_NAME"
fi

# Automatically set the target folder to the script's directory
TARGET_FOLDER="$(cd "$(dirname "$0")" && pwd)"
OUTPUT_FILE="structure.md"

# Function to generate the Markdown structure recursively
generate_structure() {
    local folder_path="$1"  # Current folder path
    local indent_level="$2" # Current indentation level for nested items

    # Iterate over all items in the folder
    for item in "$folder_path"/*; do
        # Skip if no items are found (e.g., an empty folder)
        [ -e "$item" ] || continue

        # Extract the item's name
        local item_name="$(basename "$item")"

        # Skip the script file and the generated Markdown file
        if [[ "$item_name" == "$SCRIPT_NAME" || "$item_name" == "$OUTPUT_FILE" ]]; then
            continue
        fi

        # Check if the item is a directory
        if [ -d "$item" ]; then
            # Write the folder name to the Markdown file with correct indentation
            if [ "$indent_level" -eq 0 ]; then
                printf "- 📂 **%s**\n" "$item_name" >>"$OUTPUT_FILE"
            else
                printf "%s- 📂 **%s**\n" "$(printf '  %.0s' {1..$indent_level})" "$item_name" >>"$OUTPUT_FILE"
            fi
            # Recursively process the subfolder
            generate_structure "$item" $((indent_level + 2))
        elif [ -f "$item" ]; then
            # Write the file name to the Markdown file with correct indentation
            if [ "$indent_level" -eq 0 ]; then
                printf "- 📄 %s\n" "$item_name" >>"$OUTPUT_FILE"
            else
                printf "%s- 📄 %s\n" "$(printf '  %.0s' {1..$indent_level})" "$item_name" >>"$OUTPUT_FILE"
            fi
        fi
    done
}

# Regenerate the Markdown file
echo "# File and Folder Structure of '$(basename "$TARGET_FOLDER")'" >"$OUTPUT_FILE"
echo "## Full Path: $TARGET_FOLDER" >>"$OUTPUT_FILE"
echo >>"$OUTPUT_FILE"

# Generate the structure starting at an indentation level of 0
generate_structure "$TARGET_FOLDER" 0

# Inform the user that the Markdown file has been created
echo "Markdown file generated: $TARGET_FOLDER/$OUTPUT_FILE"
