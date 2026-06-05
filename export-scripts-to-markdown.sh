#!/bin/bash
set -e
set -o pipefail

OUTPUT="all-scripts.md"
REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"

{
    echo "# All Shell Scripts Audit Report"
    echo
    echo "Generated: $(date '+%Y-%m-%d %H:%M:%S')"
    echo

    while IFS= read -r -d '' file; do
        rel="${file#$REPO_ROOT/}"
        echo "## $rel"
        echo
        echo '```bash'
        cat "$file"
        echo
        echo '```'
        echo
    done < <(find "$REPO_ROOT" \
        -path "$REPO_ROOT/new_building_os" -prune -o \
        -name "*.sh" -type f -readable -print0 | sort -z)
} > "$OUTPUT"

echo "Done. Output: $OUTPUT ($(wc -l < "$OUTPUT") lines)"
