#!/bin/bash

#==========================
# Set up the environment
#==========================
set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error
BASE_DIR_PATH="$(dirname "$(readlink -f "$0")")"
MODS_DIR_PATH=$BASE_DIR_PATH
source /root/mods/shared.sh
source /root/mods/args.sh

#==========================
# Variables for mods
#==========================
print_ok "Building variables for mods:"

echo "TARGET_UBUNTU_VERSION=$TARGET_UBUNTU_VERSION"
echo "APT_SOURCE=$APT_SOURCE"
echo "TARGET_NAME=$TARGET_NAME"
echo "TARGET_BUSINESS_NAME=$TARGET_BUSINESS_NAME"
echo "TARGET_BUILD_VERSION=$TARGET_BUILD_VERSION"


#==========================
# Model / Old
#==========================

##
## Execute the module based on the folder name.
##

function run_mods_by_dirname() {
    for mod in "$SCRIPT_DIR"/*; do
        if [[ -d "$mod" && -f "$mod/install.sh" ]]; then
            print_info "Processing mod: $mod"
            (
                cd "$mod" && \
                chmod +x install.sh && \
                bash "$mod/install.sh"
            )
        fi
    done
}


#==========================
# Model / New
#==========================

##
## The install_all_mods.txt file is used to control which modules are executed and their execution order.
##

function util_load_list() {
    local file_path="$1"
    cat $file_path  | while IFS='' read -r line; do
        trim_line=$(echo $line) # trim

        ## https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
        ## ignore leading #
        if [ "${trim_line:0:1}" == '#' ]; then
            continue;
        fi

        ## ignore empty line
        if [[ -z "$trim_line" ]]; then
            continue;
        fi

        echo "$line"
    done
}

function find_mods_list_via_loader() {
    local mods_dir_path="$MODS_DIR_PATH"
    util_load_list "$mods_dir_path/install_all_mods.txt"
}

function find_mods_list_via_cat() {
    local mods_dir_path="$MODS_DIR_PATH"
    cat "$mods_dir_path/install_all_mods.txt"
}

function find_mods_list() {
    ##local mods_list=$(find_mods_list_via_cat)
    local mods_list=$(find_mods_list_via_loader)
    echo $mods_list
}

function run_mods_by_list() {
    local mods_dir_path="$MODS_DIR_PATH"
    local mods_list=$(find_mods_list)
    local mod_name
    local mod_dir_path
    local mod_install_file_path

    for mod_name in $mods_list; do
        mod_dir_path="$mods_dir_path/$mod_name"
        mod_install_file_path="$mod_dir_path/install.sh"

        if [[ -d "$mod_dir_path" && -x "$mod_install_file_path" ]]; then
            print_info "Processing mod: $mod_name"
            cd "$mod_dir_path" && \
            bash "$mod_install_file_path"
        fi
    done
}


#==========================
# Main
#==========================

##run_mods_by_dirname
run_mods_by_list
