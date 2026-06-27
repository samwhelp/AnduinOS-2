#!/usr/bin/env bash


#=============================
# Set up the environment
#=============================

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


BASE_DIR_PATH="$(dirname "$(readlink -f "$0")")"


print_ok "Dconf DB Updating..."


#=============================
# Main
#=============================

function base_dconf_db_update() {
	dconf update
}

base_dconf_db_update
