

#=============================
# Path / Base
#=============================

##
## gear / libs
## gear / mods
##

GEAR_DIR_PATH="$(realpath "${LIBS_DIR_PATH}/..")"
MODS_DIR_PATH="${GEAR_DIR_PATH}/mods"




#=============================
# Path / Model / Base
#=============================

PLAN_DIR_PATH="$(realpath "${GEAR_DIR_PATH}/../..")"
TEMPLATE_DIR_PATH="$(realpath "${GEAR_DIR_PATH}/..")"




#=============================
# Path / Model / Skeleton
#=============================

WORK_DIR_PATH="${PLAN_DIR_PATH}/work"
DIST_DIR_PATH="${PLAN_DIR_PATH}/dist"

DISTRO_IMG_DIR_PATH="${WORK_DIR_PATH}/img"
DISTRO_ISO_DIR_PATH="${WORK_DIR_PATH}/iso"




#=============================
# Path / Model / Master
#=============================

ASSET_DIR_PATH="${TEMPLATE_DIR_PATH}/asset"
OVERLAY_DIR_PATH="${ASSET_DIR_PATH}/overlay"
PACKAGE_DIR_PATH="${ASSET_DIR_PATH}/package"
PACKAGE_INSTALL_DIR_PATH="${PACKAGE_DIR_PATH}/install"
