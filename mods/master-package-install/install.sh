set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error

BASE_DIR_PATH="$(dirname "$(readlink -f "$0")")"
ASSET_DIR_PATH="$BASE_DIR_PATH/asset"
OVERLAY_DIR_PATH="$ASSET_DIR_PATH/overlay"
PACKAGE_DIR_PATH="$ASSET_DIR_PATH/package"
PACKAGE_INSTALL_DIR_PATH="$PACKAGE_DIR_PATH/install"

#print_ok "Master Package Installing..."


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

function find_package_install_list_via_loader() {
	local package_install_list
	local list_dir_path="$PACKAGE_INSTALL_DIR_PATH"
	mkdir -p "$list_dir_path"
	local item_file_path
	for item_file_path in $list_dir_path/*.txt; do
		if [[ -f "$item_file_path" ]]; then
			util_load_list "$item_file_path"
		fi
	done
}

function find_package_install_list_via_cat() {
	local package_install_list
	local list_dir_path="$PACKAGE_INSTALL_DIR_PATH"
	mkdir -p "$list_dir_path"
	local item_file_path
	for item_file_path in $list_dir_path/*.txt; do
		if [[ -f "$item_file_path" ]]; then
			cat "$item_file_path"
		fi
	done
}

function find_package_install_list() {
	##local package_install_list=$(find_package_install_list_via_cat)
	local package_install_list=$(find_package_install_list_via_loader)
	echo $package_install_list
}

function master_package_install() {
	local package_install_list=$(find_package_install_list)
	local run_cmd="apt install $INTERACTIVE --no-install-recommends $package_install_list"
	echo $run_cmd
	$run_cmd
	#apt install $INTERACTIVE --no-install-recommends $package_install_list
	judge "Install Package"
}

master_package_install
