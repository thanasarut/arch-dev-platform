FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --needed --noconfirm \
      sudo git curl jq tree base-devel cmake vim wget openssh rsync unzip unrar \
      python python-pip uv nodejs npm ripgrep fd fzf bat eza tmux zoxide && \
    pacman -Scc --noconfirm

RUN useradd -m dev && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev