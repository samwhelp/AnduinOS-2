#!/usr/bin/env bash


#=============================
# Set up the environment
#=============================

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


#=============================
# Base Path
#=============================

BASE_DIR_PATH="$(dirname "$(readlink -f "$0")")"
LIBS_DIR_PATH="$(realpath "$BASE_DIR_PATH/../../libs")"


#=============================
# Init
#=============================

source "$LIBS_DIR_PATH/worker/init.sh"




#=============================
# Model
#=============================

function model_core_bootloader_package_install() {

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

}




#=============================
# Main
#=============================

function portal_core_bootloader_package_install() {

	core_check_permission

	print_info "Install Boot Loader Package ..."
	model_core_bootloader_package_install
	judge "Install Boot Loader Package"

}

portal_core_bootloader_package_install
