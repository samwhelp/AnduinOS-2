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

function model_anduinos_swap_packages() {

	##
	## ## Install AnduinOS swap packages
	##

	apt install $INTERACTIVE \
		$APT_CONFIG_PACKAGE \
		anduinos-archive-keyring \
		base-files \
	--install-recommends

}




#=============================
# Main
#=============================

function portal_anduinos_swap_packages() {

	core_check_permission

	#wait_network

	print_info "Installing AnduinOS APT configuration and keyring packages..."
	model_anduinos_swap_packages
	judge "Install AnduinOS basic packages"

}

portal_anduinos_swap_packages
