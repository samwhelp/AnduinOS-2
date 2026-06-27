#!/usr/bin/env bash


#=============================
# Set up the environment
#=============================

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error




#=============================
# Main
#=============================

#wait_network

print_ok "Installing anduinos-desktop (full AnduinOS desktop metapackage)..."
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
judge "Install anduinos-desktop"
