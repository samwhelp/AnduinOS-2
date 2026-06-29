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
LIBS_DIR_PATH="$BASE_DIR_PATH/libs"


#=============================
# Init
#=============================

source "$LIBS_DIR_PATH/controller/init.sh"




#=============================
# Main
#=============================

function portal_clean() {
	model_clean
}

portal_clean
