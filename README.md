# arch-dev-platform

Portable developer platform for macOS, Linux, WSL2, and Android Termux environments.

## Goals

* One reproducible development environment
* Multi-architecture support (amd64 and arm64)
* OCI image distribution via GHCR
* Usable from Docker, WSL2, and Termux proot-distro
* Public base configuration with private personal overlays

## Current Features

* GitHub Actions CI pipeline
* GitHub Container Registry (GHCR) publishing
* Multi-architecture image builds

  * linux/amd64
  * linux/arm64
* Ubuntu 24.04 development image
* Bootstrap scripts for system and user setup

## Repository Structure

```text
bootstrap/
  bootstrap-system.sh
  bootstrap-user.sh

scripts/
  install-base.sh
  apply-private.sh

Dockerfile.arch
Dockerfile.ubuntu
```

## Verified Platforms

* macOS (Apple Silicon)
* Android Termux + proot-distro OCI

## Roadmap

* Dotfiles management
* WSL2 validation
* Private overlay repository
* Arch Linux ARM support
* Developer workstation automation
