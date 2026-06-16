# syntax=docker/dockerfile:1

FROM menci/archlinuxarm:base-devel

COPY packages.txt /tmp/

RUN pacman-key --init && \
    pacman-key --populate archlinux || true && \
    pacman-key --populate archlinuxarm || true && \
    pacman -Sy --noconfirm archlinux-keyring || true && \
    pacman -Sy --noconfirm archlinuxarm-keyring || true && \
    pacman -S --needed --noconfirm $(grep -vE '^\s*(#|$)' /tmp/packages.txt) && \
    pacman -Scc --noconfirm

RUN useradd -m dev && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev

CMD ["/bin/bash"]
