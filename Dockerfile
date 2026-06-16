# syntax=docker/dockerfile:1

FROM menci/archlinuxarm:base-devel

COPY packages.txt /tmp/

RUN sed -i '/^\[options\]/a DisableSandbox' /etc/pacman.conf && \
    pacman-key --init && \
    pacman-key --populate archlinux || true && \
    pacman-key --populate archlinuxarm || true && \
    pacman -S7 --needed --noconfirm \
      archlinux-keyring \
      openssl \
      curl \
      libssh2 \
      libngtcp2 \
      pacman \
      $(grep -vE '^\s*(#|$)' /tmp/packages.txt) && \
    pacman -Scc --noconfirm

RUN useradd -m dev && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev

CMD ["/bin/bash"]
