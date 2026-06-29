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

function model_live_casper_package_install() {

	apt install $INTERACTIVE \
		casper \
		discover \
		laptop-detect \
		os-prober \
		keyutils \
	--no-install-recommends

}




#=============================
# Main
#=============================

function portal_live_casper_package_install() {

	core_check_permission

	print_info "Installing capser (live-boot) ..."
	model_live_casper_package_install
	judge "Install live-boot"

}

portal_live_casper_package_install
