# syntax=docker/dockerfile:1

FROM menci/archlinuxarm:base-devel

COPY packages.txt /tmp/

RUN sed -i '/^\[options\]/a DisableSandbox' /etc/pacman.conf && \
    pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman-key --refresh-keys && \
    pacman -Sy --needed --noconfirm \
      sudo git vim curl wget jq tree \
      openssh rsync unzip zip

RUN useradd -m dev && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev

CMD ["/bin/bash"]
