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

print_info "Install systemd package..."
apt install $INTERACTIVE \
	systemd-sysv \
	libterm-readline-gnu-perl \
--install-recommends
judge "Install systemd package"
