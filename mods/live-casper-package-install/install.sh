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

print_info "Installing capser (live-boot)..."
apt install $INTERACTIVE \
	casper \
	discover \
	laptop-detect \
	os-prober \
	keyutils \
	--no-install-recommends
judge "Install live-boot"
