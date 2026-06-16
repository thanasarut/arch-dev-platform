# syntax=docker/dockerfile:1

ARG TARGETARCH 

FROM archlinux:latest as base-amd64
FROM menci/archlinuxarm:base-devel AS base-arm64

FROM base-$(TARGETARCH}

COPY packages.txt /tmp/

RUN pacman -Syu --noconfirm && \
    pacman -S --needed --noconfirm $(cat /tmp/packages.txt) && \
    pacman -Scc --noconfirm

RUN useradd -m dev && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev

CMD ["/bin/bash"]
