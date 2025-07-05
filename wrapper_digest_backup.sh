#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# CodeDigest - Batch Repository Digest Generator (Bash script version)
#
# Description:
#   This script automates the generation of digests for multiple code
#   repositories or snapshot folders using the CodeDigest tool.
#
#   It scans each subdirectory in the specified BACKUP_DIR and produces a
#   structured XML digest using codedigest.py, saving them into OUTPUT_DIR.
#
# Requirements:
#   - Python 3.6+
#   - codedigest.py must be in the current directory or accessible in PATH
#     -> See https://github.com/TristanInSec/CodeDigest/
#
# Usage:
#   ./generate_digests.sh
#
# Output:
#   One .xml file per repository, written to ./digests/
#
# Author: Tristan (@TristanInSec)
# License: MIT
# =============================================================================

# Directory containing all your backups or source folders
BACKUP_DIR="../Backup" # Change

# Output directory for the generated digest files
OUTPUT_DIR="digests"
mkdir -p "$OUTPUT_DIR"

# Loop over each subdirectory in BACKUP_DIR
for dir in "$BACKUP_DIR"/*; do
  if [ -d "$dir" ]; then
    name=$(basename "$dir")
    output_file="$OUTPUT_DIR/${name}.xml"
    echo "[*] Generating digest for $name → $output_file"

    python3 codedigest.py \
      --path "$dir" \
      --output "$output_file" \
      --timestamp
  fi
done

echo "[✓] All digests successfully generated in '$OUTPUT_DIR/'"
