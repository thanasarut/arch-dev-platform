#!/usr/bin/env bash
set -euo pipefail

if command -v pacman >/dev/null 2>&1; then
  echo "[bootstrap] Arch detected"

  sudo pacman -Syu --noconfirm
  sudo pacman -S --needed --noconfirm \
    git vim curl wget jq tree unzip zip \
    openssh rsync base-devel tmux python python-pip nodejs npm

elif command -v apt-get >/dev/null 2>&1; then
  echo "[bootstrap] Debian/Ubuntu detected"

  sudo apt-get update
  sudo apt-get install -y --no-install-recommends \
    git vim curl wget jq tree unzip zip \
    openssh-client rsync build-essential tmux \
    python3 python3-pip nodejs npm ca-certificates

else
  echo "[bootstrap] Unsupported distro"
  exit 1
fi

git config --global init.defaultBranch main

mkdir -p "$HOME/projects"

echo "[bootstrap] done"
