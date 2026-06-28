#!/usr/bin/env bash


#=============================
# Set up the environment
#=============================

set -e						# exit on error
set -o pipefail				# exit on pipeline error
set -u						# treat unset variable as error


BASE_DIR_PATH="$(dirname "$(readlink -f "$0")")"




#=============================
# Main
#=============================

sudo "$BASE_DIR_PATH/do-build.sh"


##
## change dist owner to current user
##

[ -d "$BASE_DIR_PATH/dist" ] && sudo chown $(whoami):$(whoami) "$BASE_DIR_PATH/dist" -R
