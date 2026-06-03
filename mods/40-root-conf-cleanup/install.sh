set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error

print_ok "Cleaning up /root/.config/ and root's gnome-shell extensions"
rm /root/.config/mimeapps.list
# Note: No longer cleaning up /root/.config/dconf as we now use system-level configuration
rm /root/.local/share/gnome-shell/extensions -rf
rm /root/.cache -rf
judge "Clean up /root/.config/ and root's gnome-shell extensions"