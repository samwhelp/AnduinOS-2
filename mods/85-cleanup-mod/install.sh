set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error

# Safely remove a path or glob pattern.
# Prints a warning on missing/empty/non-matching targets so stale cleanup
# rules don't go unnoticed.  Handles both literal paths and shell globs.
cleanup_remove() {
    local target="$1"
    local label="${2:-$target}"

    # Glob pattern — expand and check for matches
    if [[ "$target" == *"*"* || "$target" == *"?"* ]]; then
        shopt -s nullglob
        local matches=($target)
        shopt -u nullglob
        if [ ${#matches[@]} -eq 0 ]; then
            print_warn "Cleanup skipped: '$label' matched nothing"
            return 0
        fi
        rm -rf "${matches[@]}"
        return 0
    fi

    # Literal path — check existence and emptiness first
    if [ ! -e "$target" ]; then
        print_warn "Cleanup skipped: '$label' does not exist"
        return 0
    fi
    if [ -d "$target" ] && [ -z "$(ls -A "$target" 2>/dev/null)" ]; then
        print_warn "Cleanup skipped: '$label' is an empty directory"
        return 0
    fi
    rm -rf "$target"
}

# Clean up root home
print_ok "Cleaning up /root/..."
cleanup_remove "/root/.config/mimeapps.list"
cleanup_remove "/root/.local/share/gnome-shell/extensions"
cleanup_remove "/root/.cache"
judge "Clean up /root/"

# Clean up apt cache
print_ok "Cleaning up apt cache..."
apt clean -y
cleanup_remove "/var/cache/apt/archives/*" "apt archives"
judge "Clean up apt cache"

# Clean up apt lists (save ~50-80MB in the squashfs; the installed system
# will re-fetch them on first apt update anyway)
print_ok "Cleaning up apt lists..."
find /var/lib/apt/lists -mindepth 1 -maxdepth 1 ! -name 'lock' ! -name 'partial' -delete 2>/dev/null || true
judge "Clean up apt lists"

# Clean up log files
print_ok "Cleaning up log files..."
cleanup_remove "/var/log/*" "log files"
judge "Clean up log files"

# Truncate machine id
print_ok "Truncating machine id..."
truncate -s 0 /etc/machine-id
truncate -s 0 /var/lib/dbus/machine-id
judge "Truncate machine id"

# Clean bash history and temp files
print_ok "Removing bash history and temporary files..."
cleanup_remove "/tmp/*" "temp files"
rm -f ~/.bash_history 2>/dev/null || true
export HISTSIZE=0
judge "Remove bash history and temporary files"

# Remove usr-is-merged folders
print_ok "Removing usr-is-merged folders..."
cleanup_remove "/bin.usr-is-merged"
cleanup_remove "/lib.usr-is-merged"
cleanup_remove "/sbin.usr-is-merged"
judge "Remove usr-is-merged folders"
