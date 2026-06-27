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

print_info "Install boodloader package..."
apt install $INTERACTIVE \
	os-prober \
	grub-common \
	grub-gfxpayload-lists \
	grub-pc \
	grub-pc-bin \
	grub2-common \
	grub-efi-amd64-signed \
	shim-signed \
	efibootmgr \
--install-recommends
judge "Install boodloader package"
