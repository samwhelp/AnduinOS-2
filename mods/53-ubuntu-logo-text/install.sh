set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error

print_ok "Installing base-files branding via apkg..."
apt install -y base-files
judge "Install base-files (logo text)"
