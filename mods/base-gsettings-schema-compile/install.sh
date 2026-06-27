#!/usr/bin/env bash


#=============================
# Set up the environment
#=============================

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


BASE_DIR_PATH="$(dirname "$(readlink -f "$0")")"


print_ok "Gsettings Schema Compiling..."


#=============================
# Main
#=============================

function base_gsettings_schema_compile() {
	glib-compile-schemas /usr/share/glib-2.0/schemas
}

base_gsettings_schema_compile
