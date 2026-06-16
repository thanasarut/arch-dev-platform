# syntax=docker/dockerfile:1

FROM menci/archlinuxarm:base-devel

COPY packages.txt /tmp/

RUN pacman -Syu --noconfirm && \
    pacman -S --needed --noconfirm $(cat /tmp/packages.txt) && \
    pacman -Scc --noconfirm

RUN useradd -m dev && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev

CMD ["/bin/bash"]
