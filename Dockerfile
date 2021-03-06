FROM archlinux:latest

# Retreive the tos repo
RUN curl https://raw.githubusercontent.com/ODEX-TOS/tos-live/master/toslive/pacman.conf > /etc/pacman.conf
RUN curl https://raw.githubusercontent.com/ODEX-TOS/tos-live/master/repo/BUILD/TOS-BASE/mirrorlist > /etc/pacman.d/tos-mirrorlist

COPY keyring/tos-revoked /usr/share/pacman/keyrings/tos-revoked 
COPY keyring/tos-trusted /usr/share/pacman/keyrings/tos-trusted 
COPY keyring/tos.gpg /usr/share/pacman/keyrings/tos.gpg 

# generate the pacman keyring
RUN pacman-key --init && pacman-key --populate

RUN pacman -Syu system-updater lsb-release tos-keyring --noconfirm --overwrite '/usr/share/pacman/keyrings/tos*'

# clear the pacman cache
RUN pacman -Sc --noconfirm

# tos version
RUN curl https://raw.githubusercontent.com/ODEX-TOS/tos-live/master/toslive/version-edit.txt > /etc/version
