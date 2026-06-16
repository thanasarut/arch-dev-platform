#!/usr/bin/env bash

sudo pacman -Syu --noconfirm

sudo pacman -S \
	git \
	vim \
	curl \
	wget \
	jq \
	tree \
	unzip \
	zip \
	openssh \
	rsync \
	base-devel \
	--noconfirm
