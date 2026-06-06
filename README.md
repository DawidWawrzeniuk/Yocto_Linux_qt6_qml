# Yocto Linux with Qt6 and QML

This repository contains the configuration files (`local.conf`, `bblayers.conf`) and a custom meta-layer designed to build a custom embedded Linux distribution featuring **Qt6** and **QML** support.

To keep the repository clean, standard upstream layers are not included and must be fetched separately.

---

## 🚀 Quick Start Guide

### 1. Prerequisites
Ensure your host system has all the necessary packages installed for Yocto compilation. For Ubuntu/Debian, run:

```bash
sudo apt update
sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential \
chrpath socat cpio python3 python3-pip python3-pexpect xz-utils \
debianutils iputils-ping python3-git python3-jinja2 python3-subunit \
zstd liblz4-tool file locales libsdl1.2-dev xterm lz4
