---
title: main-mykeybind
nav_order: 6010
has_children: false
parent: Branch
---


# main-mykeybnd

> [main-mykeybind](https://github.com/samwhelp/AnduinOS-2/tree/main-mykeybind)




## Subject

* [Environment](#environment)
* [Prepare](#prepare)
* [Clone](#clone)
* [Build](#build)
* [Rundown](#rundown)
* [Custom Modules](#custom-modules)
* [Config Files](#config-files)
* [Package Install List](#package-install-list)
* [Keybind](#keybind)
* [Discussions](#discussions)




## Environment

* Ubuntu 26.04




## Prepare




## Prepare

Open Terminal , and run to install [git](https://packages.ubuntu.com/resolute/git) and [make](https://packages.ubuntu.com/resolute/make)

``` sh
sudo apt-get install git make
```




## Clone

run to clone branch main-mykeybind

``` sh
git clone -b main-mykeybind https://github.com/samwhelp/AnduinOS-2 AnduinOS-2-main-mykeybind
```




## Build

run to build iso file

``` sh
cd AnduinOS-2-main-mykeybind

make
```




## Rundown

| Rundown |
| ------- |
| [install_all_mods.txt](https://github.com/samwhelp/AnduinOS-2/blob/main-mykeybind/mods/install_all_mods.txt) |
| [install_all_mods.sh](https://github.com/samwhelp/AnduinOS-2/blob/main-mykeybind/mods/install_all_mods.sh) |




## Custom Modules

| Custom Modules | Introduction |
| -------------- | ------------ |
| [master-package-install](https://github.com/samwhelp/AnduinOS-2/tree/main-mykeybind/mods/master-package-install) | for install extra packages |
| [master-file-install](https://github.com/samwhelp/AnduinOS-2/tree/main-mykeybind/mods/master-file-install) | for install extra files |
| [base-dconf-db-update](https://github.com/samwhelp/AnduinOS-2/tree/main-mykeybind/mods/base-dconf-db-update) |  |
| [base-gsettings-schema-compile](https://github.com/samwhelp/AnduinOS-2/tree/main-mykeybind/mods/base-gsettings-schema-compile) |  |




## Config Files

| Config Files |
| ------------ |
| [/etc/dconf/db/anduinos.d](https://github.com/samwhelp/AnduinOS-2/tree/main-mykeybind/mods/master-file-install/asset/overlay/etc/dconf/db/anduinos.d) |
| [/usr/share/glib-2.0/schemas](https://github.com/samwhelp/AnduinOS-2/tree/main-mykeybind/mods/master-file-install/asset/overlay/usr/share/glib-2.0/schemas) |




## Package Install List

> Please check the folder

* [mods/master-package-install/asset/package/install](https://github.com/samwhelp/AnduinOS-2/tree/main-mykeybind/mods/master-package-install/asset/package/install)


> And check the file

* [mods/05-live-kernel-apps-installer/install.sh](https://github.com/samwhelp/AnduinOS-2/blob/main-mykeybind/mods/05-live-kernel-apps-installer/install.sh#L26-L45)

> Ubuntu Community Help Wiki / [MetaPackages](https://help.ubuntu.com/community/MetaPackages)




## Keybind

* [Keybind Cheatsheet](https://samwhelp.github.io/anduinos-gnome-shell-adjustment/read/cheatsheet/keybind.html)




## Discussions

* [#352 - Custom AnduinOS-2 iso build script](https://github.com/Anduin2017/AnduinOS/discussions/352)
