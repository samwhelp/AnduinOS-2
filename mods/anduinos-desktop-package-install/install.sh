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

function model_anduinos_desktop_package_install() {

	apt install $INTERACTIVE \
		anduinos-desktop \
		anduinos-desktop-apps \
		anduinos-gnome-extensions \
		anduinos-appstore \
		anduinos-theme \
		anduinos-wallpapers \
		anduinos-fonts \
		anduinos-no-snapd \
		anduinos-session \
		anduinos-software-properties-common \
		anduinos-software-properties-gtk \
		anduinos-system-tweaks \
		firefox-anduinos \
		gnome-shell-extension-appindicator-anduinos \
		gnome-shell-extension-dash-to-panel-anduinos \
		gnome-shell-extension-desktop-icons-ng-anduinos \
		plymouth-anduinos \
		alsa-ucm-conf-anduinos \
		firmware-sof-anduinos \
		initramfs-tools \
	--install-recommends

}




#=============================
# Main
#=============================

function portal_anduinos_desktop_package_install() {

	core_check_permission

	#wait_network

	print_info "Install anduinos-desktop (full AnduinOS desktop metapackage) ..."
	model_anduinos_desktop_package_install
	judge "Install anduinos-desktop (full AnduinOS desktop metapackage)"

}

portal_anduinos_desktop_package_install
