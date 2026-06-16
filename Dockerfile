# syntax=docker/dockerfile:1

FROM menci/archlinuxarm:base-devel

COPY packages.txt /tmp/

RUN echo 'DisableSandbox' >> /etc/pacman.conf && \
    pacman-key --init && \
    pacman-key --populate archlinux || true && \
    pacman-key --populate archlinuxarm || true && \
    pacman -Sy --noconfirm archlinux-keyring openssl pacman || true && \
    pacman -Sy --noconfirm archlinuxarm-keyring openssl pacman || true && \
    pacman -S --needed --noconfirm $(grep -vE '^\s*(#|$)' /tmp/packages.txt) && \
    pacman -Scc --noconfirm

RUN useradd -m dev && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev

CMD ["/bin/bash"]
