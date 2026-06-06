set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error

print_ok "Installing capser (live-boot)..."
wait_network
apt install $INTERACTIVE \
    casper \
    discover \
    laptop-detect \
    os-prober \
    keyutils \
    --no-install-recommends
judge "Install live-boot"

print_ok "Installing kernel..."
apt install $INTERACTIVE \
    linux-image-generic-hwe-26.04 \
    linux-headers-generic-hwe-26.04 \
    --no-install-recommends
judge "Install kernel"