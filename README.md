# Yocto Linux + Qt6/QML

This project presents a Yocto environment configuration for building an Embedded Linux image with Qt6 and QML support.

The repository contains only custom configuration files and a custom Yocto layer. Standard Yocto layers are not included because they are publicly available and can be downloaded from their official sources.

## Repository Contents

```text
.
├── conf/
│   ├── local.conf
│   └── bblayers.conf
└── meta-dawid/
```

### File Description

* `local.conf` – build configuration parameters.
* `bblayers.conf` – list of layers used by the project.
* `meta-dawid` – custom layer containing recipes, configurations, or project-specific modifications.

## Required Layers

To build the project successfully, you need to download the standard Yocto layers, which are not included in this repository.

Example layer setup:

* poky

  * meta
  * meta-poky
  * meta-yocto-bsp
* meta-openembedded

  * meta-oe
  * meta-python
  * meta-qt6

## Downloading Layers

Example:

```bash
git clone git://git.yoctoproject.org/poky
git clone https://github.com/openembedded/meta-openembedded.git
git clone https://code.qt.io/yocto/meta-qt6.git
```

After downloading the layers:

1. Create a Yocto build environment.
2. Copy the `local.conf` and `bblayers.conf` files from this repository.
3. Add the custom layer included in this repository.
4. Verify the layer paths in `bblayers.conf`.

You can also add layers using the `bitbake-layers` command:

```bash
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-qt6
bitbake-layers add-layer ../meta-dawid
```

Use paths appropriate for your directory structure.

## Building the Image

```bash
source oe-init-build-env

bitbake <image-name>
```

Example:

```bash
bitbake core-image-base
```
or 

```bash
bitbake core-image-weston
```

## Running the image on Raspberry pi 5
```bash
qmlscene hello.qml
```


## Project Goals

* Yocto Project environment configuration,
* Qt6 integration,
* QML application support,
* creating custom layers and recipes,
* building Embedded Linux images.

## Notes

This repository intentionally does not include standard Yocto layers such as:

* poky,
* meta-openembedded,
* meta-qt6,
* other external layers.

These are officially maintained projects and should be downloaded separately. This repository contains only files specific to this configuration and the custom project layer.

## License

This project is provided for educational and demonstration purposes.
