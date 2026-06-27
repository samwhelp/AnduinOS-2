#!/usr/bin/env bash


#=============================
# Set up the environment
#=============================

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


BASE_DIR_PATH="$(dirname "$(readlink -f "$0")")"
LIBS_DIR_PATH="$BASE_DIR_PATH"
MODS_DIR_PATH="$BASE_DIR_PATH/mods"

source "$LIBS_DIR_PATH/args.sh"
source "$LIBS_DIR_PATH/shared.sh"
source "$LIBS_DIR_PATH/model.sh"



#=============================
# Main
#=============================

function portal_create_core_system() {
	model_create_core_system
}

portal_create_core_system
