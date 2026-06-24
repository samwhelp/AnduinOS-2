#!/usr/bin/env bash


set -e                  # exit on error
set -o pipefail         # exit on pipeline error
set -u                  # treat unset variable as error


BASE_DIR_PATH="$(dirname "$(readlink -f "$0")")"
LIBS_DIR_PATH="$(realpath "$BASE_DIR_PATH/..")"


##
## * uncomment these two line when developing
## * comment these two line when releasing
##
source "$LIBS_DIR_PATH/args.sh"
source "$LIBS_DIR_PATH/shared.sh"




print_ok "Demo Installing..."

apt install -y \
    nano \
    micro \
    vim \
    neovim \
    --no-install-recommends
judge "Install extra packages"
