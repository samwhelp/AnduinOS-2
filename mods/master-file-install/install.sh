#!/usr/bin/env bash


#=============================
# Set up the environment
#=============================

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


BASE_DIR_PATH="$(dirname "$(readlink -f "$0")")"
MASTER_ASSET_DIR_PATH="$BASE_DIR_PATH/asset"
MASTER_OVERLAY_DIR_PATH="$MASTER_ASSET_DIR_PATH/overlay"
MASTER_PACKAGE_DIR_PATH="$MASTER_ASSET_DIR_PATH/package"
MASTER_PACKAGE_INSTALL_DIR_PATH="$MASTER_PACKAGE_DIR_PATH/install"


print_ok "Master File Installing..."


#=============================
# Main
#=============================

function master_file_install() {
	mkdir -p "$MASTER_OVERLAY_DIR_PATH"
	cp -rfT "$MASTER_OVERLAY_DIR_PATH" /
}

master_file_install
