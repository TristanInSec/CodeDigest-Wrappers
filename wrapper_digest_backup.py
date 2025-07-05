#!/usr/bin/env python3
"""
===============================================================================
CodeDigest - Batch Digest Generator (Python Version)

Description:
    This script automates the generation of structured digest files (XML)
    for multiple codebase snapshots located in the ../Backup directory.

    It uses codedigest.py to scan each subdirectory and generate a digest
    file into the "digests/" folder, preserving structure and embedding
    readable content in XML format.

Requirements:
    - Python 3.6+
    - codedigest.py in the same directory or in PATH
     -> See https://github.com/TristanInSec/CodeDigest/
    - PyYAML (if using YAML output)

Usage:
    python3 generate_digests.py

Author: Tristan (@TristanInSec)
License: MIT
===============================================================================
"""

import subprocess
from pathlib import Path

BACKUP_DIR = Path("../Backup") # Change
OUTPUT_DIR = Path("digests")
OUTPUT_DIR.mkdir(exist_ok=True)

for sub in sorted(BACKUP_DIR.iterdir()):
    if sub.is_dir():
        name = sub.name
        out_file = OUTPUT_DIR / f"{name}.xml"
        print(f"[*] Generating digest for {name} → {out_file.name}")
        subprocess.run([
            "python3", "codedigest.py",
            "--path", str(sub),
            "--output", str(out_file),
            "--timestamp"
        ], check=True)

print(f"[*] All digests generated in {OUTPUT_DIR}/")
