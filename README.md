
# CodeDigest Wrappers

**CodeDigest-Wrappers** is a companion repository to [CodeDigest](https://github.com/TristanInSec/CodeDigest), providing automation scripts to batch-process multiple source code repositories or snapshot folders into AI-friendly digest formats (XML by default).

These wrappers simplify using `codedigest.py` across multiple projects or backup folders.


## Included Scripts

### 1. `wrapper_digest_backup.py` – Python Version

A Python script that loops through each subdirectory in a given `Backup` directory and generates digest files using CodeDigest.

#### Features
- Cross-platform
- Uses `subprocess` to call `codedigest.py`
- Clean output to a `digests/` folder
- Easy to extend with Python logic

#### Requirements
- Python 3.6+
- `codedigest.py` (from [CodeDigest](https://github.com/TristanInSec/CodeDigest)) must be in the same directory or in PATH
- `PyYAML` if YAML output is desired

#### Usage
```
python3 generate_digests.py
```

### 2. `wrapper_digest_backup.sh` – Bash Version

A lightweight Bash wrapper script for the same functionality. Works well in Linux/macOS shells or CI/CD pipelines.

#### Features
- Minimal dependencies
- Uses `set -euo pipefail` for safe execution
- Outputs one digest file per directory

#### Requirements
- Bash (Linux/macOS)
- Python 3.6+ with `codedigest.py` available
- `PyYAML` if YAML output is desired

#### Usage
```
chmod +x generate_digests.sh
./generate_digests.sh
```

## License

**MIT** — free to use, modify, and distribute.

## Author

Created by [@TristanInSec](https://github.com/TristanInSec)

For the main tool, see: [CodeDigest](https://github.com/TristanInSec/CodeDigest)
