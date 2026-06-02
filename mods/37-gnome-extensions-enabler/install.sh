#!/usr/bin/env bash
# Enable GNOME Shell extensions system-wide and ensure compatibility
# with the target GNOME Shell version.
#
# Extensions are already installed via apt (mod 27).  This mod only
# handles two post-install concerns:
#
# 1. Enable extensions visible in system-wide /usr/share so they appear
#    by default for all users (including the live-session user).
#
# 2. Patch metadata.json shell-version arrays when an upstream extension
#    hasn't declared support for the current GNOME version yet.  This is
#    a temporary compatibility shim — remove individual patches as
#    upstreams release updates.
set -euo pipefail

source /root/mods/shared.sh
source /root/mods/args.sh

print_ok "Enabling GNOME Shell extensions..."

# gnome-extensions (from gnome-shell-extension-prefs or gnome-shell package)
# can enable extensions directly.  Installed to /usr/share, they are
# visible to all users; enabling them here ensures the live session and
# newly-created users see them by default.
enable_ext() {
    local uuid="$1"
    if gnome-extensions enable "$uuid" 2>/dev/null; then
        print_info "  Enabled $uuid"
    else
        print_warn "  Could not enable $uuid (may already be enabled or incompatible)"
    fi
}

enable_ext arcmenu@arcmenu.com
enable_ext blur-my-shell@aunetx
enable_ext ProxySwitcher@flannaghan.com
enable_ext customize-ibus@hollowman.ml
enable_ext dash-to-panel@jderose9.github.com
enable_ext network-stats@gnome.noroadsleft.xyz
enable_ext simple-weather@romanlefler.com
enable_ext switcher@anduinos
enable_ext noti-bottom-right@anduinos
enable_ext loc@anduinos.com
enable_ext lockkeys@vaina.lt
enable_ext tiling-assistant@leleat-on-github
enable_ext mediacontrols@cliffniff.github.com
enable_ext clipboard-indicator@tudmotu.com
enable_ext accent-gtk-theme@brgvos
enable_ext accent-user-theme@brgvos
enable_ext accent-icons-theme@brgvos

judge "Enable extensions"

# ── Shell-version compatibility shim ──────────────────────────────────
# Some upstream extensions lag behind Ubuntu's GNOME release.  Append
# the current shell version to metadata.json so they load correctly.
# Remove individual patches when upstreams ship compatible releases.

TARGET_SHELL="50"   # GNOME Shell major version shipped with Ubuntu resolute

print_ok "Patching extension metadata.json for GNOME Shell $TARGET_SHELL compatibility..."

apt install -y jq --no-install-recommends
judge "Install jq"

find /usr/share/gnome-shell/extensions -type f -name metadata.json | while IFS= read -r file; do
    if jq -e 'has("shell-version")' "$file" > /dev/null; then
        if jq -e --arg v "$TARGET_SHELL" '.["shell-version"] | index($v)' "$file" > /dev/null; then
            print_info "  OK: $file already supports $TARGET_SHELL"
        else
            print_warn "  PATCH: $file ← add shell-version $TARGET_SHELL"
            tmpfile=$(mktemp)
            jq --arg v "$TARGET_SHELL" '.["shell-version"] += [$v]' "$file" > "$tmpfile" && mv "$tmpfile" "$file"
            chmod 644 "$file"
        fi
    else
        print_error "  SKIP: $file has no shell-version key"
    fi
done

judge "Patch metadata.json shell-version"
