#!/usr/bin/env bash


#=============================
# Set up the environment
#=============================

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error




#=============================
# Main
#=============================

print_info "Installing initramfs-tools..."
apt install $INTERACTIVE \
	initramfs-tools \
	zstd \
	--no-install-recommends
judge "Install initramfs-tools"
