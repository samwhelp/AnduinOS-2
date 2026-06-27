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

print_info "Setting up hostname..."
echo "$TARGET_NAME" > /etc/hostname
judge "Set up hostname to $TARGET_NAME"
