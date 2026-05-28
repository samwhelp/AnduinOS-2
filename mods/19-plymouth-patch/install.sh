set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error

print_ok "Installing plymouth branding via apkg..."
apt install -y anduinos-plymouth-branding
judge "Install plymouth branding"

# Prevent ubuntu's plymouth-theme-spinner from overwriting our branding
print_ok "Marking plymouth-theme-spinner as held..."
apt-mark hold plymouth-theme-spinner
judge "Mark plymouth-theme-spinner as held"

print_ok "Marking plymouth-theme-spinner as not upgradeable..."
cat << EOF > /etc/apt/preferences.d/no-upgrade-plymouth-theme-spinner
Package: plymouth-theme-spinner
Pin: release o=Ubuntu
Pin-Priority: -1
EOF
judge "Create PIN file for plymouth-theme-spinner"
