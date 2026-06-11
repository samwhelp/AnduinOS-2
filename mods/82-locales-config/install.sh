set -e
set -o pipefail
set -u

print_ok "Reconfiguring locales..."
cat /usr/share/i18n/SUPPORTED > /etc/locale.gen
dpkg-reconfigure locales
judge "Reconfigure locales"
