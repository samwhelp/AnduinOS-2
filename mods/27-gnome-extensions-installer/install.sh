#!/usr/bin/env bash
# Install all AnduinOS-packaged GNOME Shell extensions via apt.
#
# Previously each extension was downloaded individually from
# extensions.gnome.org via gext (mod 27) or cp'd from the mod directory
# (mods 31/32/33).  Now all extensions are built and published as Apkg
# packages, so a single apt invocation replaces all of that.
set -euo pipefail

source /root/mods/shared.sh

print_ok "Installing AnduinOS GNOME Shell extensions via apt..."

apt install -y \
    gnome-shell-extension-accent-gtk-theme \
    gnome-shell-extension-accent-user-theme \
    gnome-shell-extension-accent-icons-theme \
    gnome-shell-extension-arcmenu \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-proxy-switcher \
    gnome-shell-extension-customize-ibus \
    gnome-shell-extension-dash-to-panel-anduinos \
    gnome-shell-extension-network-stats \
    gnome-shell-extension-simple-weather \
    gnome-shell-extension-lockkeys \
    gnome-shell-extension-tiling-assistant \
    gnome-shell-extension-mediacontrols \
    gnome-shell-extension-clipboard-indicator \
    gnome-shell-extension-anduinos-loc \
    gnome-shell-extension-anduinos-switcher \
    gnome-shell-extension-noti-bottom-right

judge "Install GNOME Shell extensions"

# Compile gschemas for all extensions that ship them
print_ok "Compiling extension gschemas..."
for ext_dir in /usr/share/gnome-shell/extensions/*/; do
    if ls "$ext_dir/schemas/"*.gschema.xml 1>/dev/null 2>&1; then
        glib-compile-schemas "$ext_dir/schemas"
    fi
done
judge "Compile extension gschemas"
