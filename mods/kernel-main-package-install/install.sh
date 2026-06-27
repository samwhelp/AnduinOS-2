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

print_info "Installing kernel..."
apt install $INTERACTIVE \
	linux-image-generic-hwe-26.04 \
	linux-headers-generic-hwe-26.04 \
	thermald \
	--no-install-recommends
judge "Install kernel"
