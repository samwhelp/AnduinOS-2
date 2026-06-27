#!/usr/bin/env bash


#=============================
# Set up the environment
#=============================

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


BASE_DIR_PATH="$(dirname "$(readlink -f "$0")")"
ASSET_DIR_PATH="$BASE_DIR_PATH/asset"
OVERLAY_DIR_PATH="$ASSET_DIR_PATH/overlay"
PACKAGE_DIR_PATH="$ASSET_DIR_PATH/package"
PACKAGE_INSTALL_DIR_PATH="$PACKAGE_DIR_PATH/install"


print_ok "Master File Installing..."


#=============================
# Main
#=============================

function master_file_install() {
	mkdir -p "$OVERLAY_DIR_PATH"
	cp -rfT "$OVERLAY_DIR_PATH" /
}

master_file_install
