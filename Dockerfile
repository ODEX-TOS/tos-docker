FROM archlinux/base:latest

# Retreive the tos repo
RUN curl https://raw.githubusercontent.com/ODEX-TOS/tos-live/master/toslive/pacman.conf > /etc/pacman.conf

# Update database data
RUN pacman -Syu --noconfirm

RUN pacman -Syu git --noconfirm

RUN curl https://raw.githubusercontent.com/ODEX-TOS/tos-live/master/toslive/version-edit.txt > /etc/version

RUN pacman -Syu system-updater ccat lsb-release --noconfirm

RUN pacman -Syu base-devel --noconfirm

# clear the pacman cache
RUN pacman -Sc --noconfirm
