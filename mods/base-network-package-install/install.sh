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

print_info "Install network package..."
apt install $INTERACTIVE \
	network-manager \
	net-tools \
	resolvconf \
--install-recommends
judge "Install network package"
