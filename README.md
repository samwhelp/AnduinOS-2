

# AnduinOS-2 / ISO Build Script




## Subject

* [Environment](#environment)
* [Prepare](#prepare)
* [Clone](#clone)
* [Usage](#usage)
* [Howto](#howto)
* [System](#system)
* [Discussions](#discussions)




## Environment

* Ubuntu 26.04




## Prepare

Open Terminal , and run to install [git](https://packages.ubuntu.com/resolute/git) and [make](https://packages.ubuntu.com/resolute/make)

``` sh
sudo apt-get install git make
```




## Clone

run to clone branch demo-build-steps

``` sh
git clone -b demo-build-steps https://github.com/samwhelp/AnduinOS-2 AnduinOS-2-demo-build-steps
```




## Usage

### help

run

``` sh
make
```

or run

``` sh
make help
```

show

```
make
Usage:
	$ make [action]

Example:
	$ make
	$ make help

	$ make clean

	$ make create-core-system
	$ make create-base-system
	$ make create-basic-system
	$ make create-full-system

	$ make mount
	$ make unmount

	$ make chroot

	$ make archive-system-to-iso

	$ make prepare
	$ make build

```




## Howto

## Howto / Prepare

> Run the following command to install the packages required to create an ISO file.

``` sh
make prepare
```




## Howto / Separate Steps Mode

> Run to create new system

``` sh
make create-full-system
```

> Enter the chroot environment

``` sh
make chroot
```

> We can run `exit` to leave the chroot environment.

``` sh
exit
```

> Next, we can execute the following command to create the ISO file.

``` sh
make archive-system-to-iso
```




## Howto / One Step Mode

We only need to execute the following command to create an ISO file.

``` sh
make build
```




## System

* [model.sh](https://github.com/samwhelp/AnduinOS-2/blob/demo-build-steps/model.sh#L169)

| System | Fulfill Rundown | Introduction |
| ------ | ------- | ------------ |
| `make create-core-system` | none | `debootstrap` |
| `make create-base-system` | [fulfill-for-base-system.txt](https://github.com/samwhelp/AnduinOS-2/blob/demo-build-steps/mods/fulfill-for-base-system.txt) | `debootstrap + base settings` |
| `make create-basic-system` | [fulfill-for-basic-system.txt](https://github.com/samwhelp/AnduinOS-2/blob/demo-build-steps/mods/fulfill-for-basic-system.txt) | `debootstrap + base settings + anduinos apt-sources` |
| `make create-full-system` | [fulfill-for-full-system.txt](https://github.com/samwhelp/AnduinOS-2/blob/demo-build-steps/mods/fulfill-for-full-system.txt) | `debootstrap + base settings + anduinos apt-sources + extra` |




## Discussions

* [#351 - Question when trying to build AnduinOS 2.0 ISO](https://github.com/Anduin2017/AnduinOS/discussions/351#discussioncomment-17422832)
