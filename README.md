# Directory Structure Generator

A script compatible with both `zsh` and `bash` to generate a Markdown file outlining the folder and file structure of the directory where the script is executed. The generated structure is presented in a readable Markdown format for easy documentation and sharing.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Usage Instructions](#usage-instructions)
- [How It Works](#how-it-works)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Licence](#licence)

## Overview

This script generates a Markdown file, `structure.md`, detailing the folder and file hierarchy of the directory in which it is executed. The script excludes itself and its output file from the generated structure, making it ideal for documenting repositories, projects, or file collections.

## Features

- Compatible with **bash** and **zsh**
- Recursively scans folders and files starting from the script’s directory
- Outputs a well-structured Markdown file with:
  - **📂 Folder icons**
  - **📄 File icons**
- Dynamically adjusts indentation for nested structures
- Automatically excludes the script file and the generated Markdown file

## Requirements

- **Operating System:** macOS or Linux
- **Shell:** _bash_ or _zsh_
- **Tools Required:**
  - `printf`
  - `cd`
  - `basename`

These utilities are included in most Unix-based operating systems.

## Usage Instructions
1. Save and execute the scripts in the chosen directory:
   1. Save the zsh or bash script in the folder with the files to process
   1. Make it executable: `chmod +x ./directory-structure-generator.zsh` resp. `chmod +x directory-structure-generator.sh`
   1. Run the script: `./directory-structure-generator.zsh` resp. `./directory-structure-generator.sh`
1. View the output:
   - The script generates a `structure.md` file in the same directory. Open it with a text or Markdown viewer

## How It Works

1. **Script Execution Detection:**
   - Identifies whether the script is run as a shell command or a script file
1. **Target Folder and Output File Setup:**
   - Automatically sets the target folder to the script’s directory
   - Defines the output Markdown file as `structure.md`
1. **Recursive Directory Traversal:**
   - Iterates over all items in the folder recursively
   - Adds folder and file names to the Markdown file with appropriate indentation and icons
1. **Exclusion Rules:**
   - Excludes the script itself and the output file from the generated structure

## Troubleshooting

- **Permission Denied:** Ensure the script has executable permissions: `chmod +x ./directory-structure-generator.zsh` resp. `chmod +x ./directory-structure-generator.sh`
- **Empty Output File:** Verify that the directory contains files and is not empty
- **File Not Found Errors:** Confirm that required commands (`basename`, `printf`, etc.) are installed and available

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork this repository
1. Create a feature branch: `git checkout -b feature-branch`
1. Commit your changes: `git commit -m "Add feature"`
1. Push the branch: `git push origin feature-branch`
1. Submit a pull request

Please ensure all changes are well-documented and tested.

**Suggestions for improvements are highly encouraged!** Please ensure that your contributions adhere to the project’s coding standards and include appropriate documentation.

## Licence

This project is licenced under the [MIT Licence](https://opensource.org/license/mit "MIT Licence"). You are free to use, modify, and distribute this project in compliance with the licence terms.
