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

function model_anduinos_installer_package_install() {

	apt install $INTERACTIVE \
		anduinos-installer-config \
	--no-install-recommends

}




#=============================
# Main
#=============================

function portal_anduinos_installer_package_install() {

	core_check_permission

	print_info "Installing AnduinOS installer (Ubiquity + wrapper + slides + bwrap compat) ..."
	model_anduinos_installer_package_install
	judge "Install anduinos-installer-config"

}

portal_anduinos_installer_package_install
