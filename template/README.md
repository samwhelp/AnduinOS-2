

# AnduinOS-2 / ISO Build Script Template




## Subject

* [Environment](#environment)
* [Prepare](#prepare)
* [Clone](#clone)
* [Usage](#usage)
* [Howto](#howto)
* [Discussions](#discussions)
* [Refactoring Evolution](#refactoring-evolution)




## Environment

* Ubuntu 26.04




## Prepare

Open Terminal , and run to install [git](https://packages.ubuntu.com/resolute/git) and [make](https://packages.ubuntu.com/resolute/make)

``` sh
sudo apt-get install git make
```




## Clone

run to clone branch demo-build-template

``` sh
git clone -b demo-build-template https://github.com/samwhelp/AnduinOS-2 AnduinOS-2-demo-build-template
```

run change dir `AnduinOS-2-demo-build-template/template`

``` sh
cd AnduinOS-2-demo-build-template/template
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
Usage:
	$ make [action]

Example:
	$ make
	$ make help

	$ make prepare
	$ make build
	$ make clean

```




## Howto

## Howto / Prepare

> Run the following command to install the packages required to create an ISO file.

``` sh
make prepare
```




## Howto / Build

We only need to execute the following command to create an ISO file.

``` sh
make build
```




## Howto / Clean

Run to clean.

``` sh
make clean
```




## Discussions

* [#352 - Custom AnduinOS-2 iso build script](https://github.com/Anduin2017/AnduinOS/discussions/352)




## Refactoring Evolution

| Refactoring Evolution |
| --------------------- |
| [prototype-2.0.0](https://github.com/samwhelp/AnduinOS-2/tree/prototype-2.0.0) |
| [demo-build-steps](https://github.com/samwhelp/AnduinOS-2/tree/demo-build-steps) |
| [demo-build-engine](https://github.com/samwhelp/AnduinOS-2/tree/demo-build-engine) |
| [demo-build-template](https://github.com/samwhelp/AnduinOS-2/tree/demo-build-template) |
