

#=============================
# Path / Base
#=============================

##
## * plan / template / gear
## * plan / template / gear / libs
## * plan / template / gear / mods
##

GEAR_DIR_PATH="$(realpath "${LIBS_DIR_PATH}/..")"
MODS_DIR_PATH="${GEAR_DIR_PATH}/mods"




#=============================
# Path / Model / Base
#=============================

##
## * plan / template
##

PLAN_DIR_PATH="$(realpath "${GEAR_DIR_PATH}/../..")"
TEMPLATE_DIR_PATH="$(realpath "${GEAR_DIR_PATH}/..")"




#=============================
# Path / Model / Skeleton
#=============================

##
## * plan / dist
## * plan / work
## * plan / work / img
## * plan / work / iso
##

DIST_DIR_PATH="${PLAN_DIR_PATH}/dist"
WORK_DIR_PATH="${PLAN_DIR_PATH}/work"

DISTRO_IMG_DIR_PATH="${WORK_DIR_PATH}/img"
DISTRO_ISO_DIR_PATH="${WORK_DIR_PATH}/iso"




#=============================
# Path / Model / Master
#=============================

##
## * paln / template / asset
## * plan / template / asset / overlay
## * plan / template / asset / package
## * plan / template / asset / package / install
##

MASTER_ASSET_DIR_PATH="${TEMPLATE_DIR_PATH}/asset"
MASTER_OVERLAY_DIR_PATH="${MASTER_ASSET_DIR_PATH}/overlay"
MASTER_PACKAGE_DIR_PATH="${MASTER_ASSET_DIR_PATH}/package"
MASTER_PACKAGE_INSTALL_DIR_PATH="${MASTER_PACKAGE_DIR_PATH}/install"
