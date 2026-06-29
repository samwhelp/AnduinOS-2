#!/usr/bin/env bash


#=============================
# Module
#=============================

function core_check_permission() {

	if [ $(id -u) -ne 0 ]; then
		print_error "This script should be run as 'root'"
		exit 1
	fi

}

function core_var_dump() {

	print_info "Dump variable"

	echo "GEAR_DIR_PATH=$GEAR_DIR_PATH"
	echo "LIBS_DIR_PATH=$LIBS_DIR_PATH"
	echo "MODS_DIR_PATH=$MODS_DIR_PATH"

	echo "PLAN_DIR_PATH=$PLAN_DIR_PATH"
	echo "TEMPLATE_DIR_PATH=$TEMPLATE_DIR_PATH"

	echo "WORK_DIR_PATH=$WORK_DIR_PATH"
	echo "DIST_DIR_PATH=$DIST_DIR_PATH"
	echo "DISTRO_IMG_DIR_PATH=$DISTRO_IMG_DIR_PATH"
	echo "DISTRO_ISO_DIR_PATH=$DISTRO_ISO_DIR_PATH"

	echo "ASSET_DIR_PATH=$ASSET_DIR_PATH"
	echo "OVERLAY_DIR_PATH=$OVERLAY_DIR_PATH"
	echo "PACKAGE_DIR_PATH=$PACKAGE_DIR_PATH"
	echo "PACKAGE_INSTALL_DIR_PATH=$PACKAGE_INSTALL_DIR_PATH"

	judge "Dump variable"

}
