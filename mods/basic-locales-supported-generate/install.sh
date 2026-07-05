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

function model_basic_locales_supported_generate() {

	print_info "Generating locales from SUPPORTED_LOCALES..."

	if [ -z "${SUPPORTED_LOCALES:-}" ]; then
		print_error "SUPPORTED_LOCALES is empty or not set — cannot generate locales"
		exit 1
	fi

	> /etc/locale.gen
	while IFS="|" read -r code _; do
		# trim whitespace that may trail the locale code
		code=$(printf '%s' "$code" | xargs)
		[ -z "$code" ] && continue
		if [[ "$code" =~ ^[a-z]{2}_[A-Z]{2}$ ]]; then
			echo "${code}.UTF-8 UTF-8" >> /etc/locale.gen
		else
			print_warn "Skipping malformed locale code from SUPPORTED_LOCALES: '$code'"
		fi
	done <<< "$SUPPORTED_LOCALES"

	if [ ! -s /etc/locale.gen ]; then
		print_error "No valid locales extracted from SUPPORTED_LOCALES"
		exit 1
	fi

	print_info "Generating locales (this might take a while) ..."
	locale-gen
	judge "Generate locales from SUPPORTED_LOCALES"

}




#=============================
# Main
#=============================

function portal_basic_locales_supported_generate() {

	core_check_permission

	print_info "Config Locale ..."
	model_basic_locales_supported_generate
	judge "Config Locale"

}

portal_basic_locales_supported_generate
