FROM archlinux:latest

COPY packages.txt /tmp/

RUN pacman -Syu --noconfirm && \
    pacman -S --needed --noconfirm $(cat /tmp/packages.txt)

RUN useradd -m dev && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev

CMD ["/bin/bash"]
