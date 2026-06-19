---
title: main-respin
nav_order: 6020
has_children: false
parent: Branch
---


# main-respin

> [main-respin](https://github.com/samwhelp/AnduinOS-2/tree/main-respin)




## Subject

* [Environment](#environment)
* [Prepare](#prepare)
* [Clone](#clone)
* [Build](#build)
* [Rundown](#rundown)
* [Custom Modules](#custom-modules)
* [Config Files](#config-files)
* [Package Installation List](#package-installation-list)
* [Notice](#notice)




## Environment

* Ubuntu 26.04




## Prepare

Open Terminal , and run to install [git](https://packages.ubuntu.com/resolute/git) and [make](https://packages.ubuntu.com/resolute/make)

``` sh
sudo apt-get install git make
```




## Clone

run git clone branch main-respin

``` sh
git clone -b main-respin https://github.com/samwhelp/AnduinOS-2 AnduinOS-2-main-respin
```




## Build

``` sh
cd AnduinOS-2-main-respin

make
```




## Rundown

| Rundown |
| ------- |
| [install_all_mods.txt](https://github.com/samwhelp/AnduinOS-2/blob/main-respin/mods/install_all_mods.txt) |
| [install_all_mods.sh](https://github.com/samwhelp/AnduinOS-2/blob/main-respin/mods/install_all_mods.sh) |




## Custom Modules

| Custom Modules | Introduction |
| -------------- | ------------ |
| [master-package-install](https://github.com/samwhelp/AnduinOS-2/tree/main-respin/mods/master-package-install) | for install extra packages |
| [master-file-install](https://github.com/samwhelp/AnduinOS-2/tree/main-respin/mods/master-file-install) | for install extra files |
| [base-dconf-db-update](https://github.com/samwhelp/AnduinOS-2/tree/main-respin/mods/base-dconf-db-update) |  |
| [base-gsettings-schema-compile](https://github.com/samwhelp/AnduinOS-2/tree/main-respin/mods/base-gsettings-schema-compile) |  |

* See the [Notice](#notice)




## Config Files

| Config Files |
| ------------ |
| [~/.config](https://github.com/samwhelp/AnduinOS-2/tree/main-respin/mods/master-file-install/asset/overlay/etc/skel/.config) |
| [/etc/dconf/db/anduinos.d](https://github.com/samwhelp/AnduinOS-2/tree/main-respin/mods/master-file-install/asset/overlay/etc/dconf/db/anduinos.d) |
| [/usr/share/glib-2.0/schemas](https://github.com/samwhelp/AnduinOS-2/tree/main-respin/mods/master-file-install/asset/overlay/usr/share/glib-2.0/schemas) |




## Package Installation List

> Please check the folder [mods/master-package-install/asset/package/install](https://github.com/samwhelp/AnduinOS-2/tree/main-respin/mods/master-package-install/asset/package/install)




## Notice

> I [created](https://github.com/samwhelp/AnduinOS-2/tree/main-respin/mods/master-file-install/asset/overlay/etc) two file `/etc/localtime` and `/etc/timezone`. Therefore, I changed the relevant code in the [file: mods/85-cleanup-mod/install.sh](https://github.com/samwhelp/AnduinOS-2/blob/main-respin/mods/85-cleanup-mod/install.sh#L36-L39) into comments.
