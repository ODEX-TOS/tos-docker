FROM archlinux/base:latest

# Retreive the tos repo
RUN curl https://raw.githubusercontent.com/ODEX-TOS/tos-live/master/toslive/pacman.conf > /etc/pacman.conf

# Update database data
RUN pacman -Syu --noconfirm

RUN pacman -Syu git base-devel system-updater ccat lsb-release --noconfirm

# clear the pacman cache
RUN pacman -Sc --noconfirm

# tos version
RUN curl https://raw.githubusercontent.com/ODEX-TOS/tos-live/master/toslive/version-edit.txt > /etc/version
