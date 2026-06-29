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

function model_skel() {

	core_var_dump

}




#=============================
# Main
#=============================

function portal_skel() {

	core_check_permission

	print_info "Install ..."
	model_skel
	judge "Install"

}

portal_skel
