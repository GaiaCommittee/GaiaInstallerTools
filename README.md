# GaiaInstallerTools
Tools for installing Gaia modules and services.

## GaiaInstall

This script is used for install local modules.
Currently it supports two kind of installation target: compressed file (.zip) and directory,
and two kinds of installation: simple folder and folder with a CMakeLists.txt.

### Simple Folder Installation

If the folder contains a install_script.sh and it is executable, then the folder contains will be copied to the temporary folder and this script will be executed there. 

Contains in the installation folder will be copied to `/usr/local/`

### CMake Folder Installation

A folder with a CMakeLists.txt will be considered as CMake folder, and the root CMakeLists.txt will be executed and built.
The building command line is `make -j install`.

Before and after building, `preinstall_script.sh` and `postinstall_script.sh` will be executed seperately.