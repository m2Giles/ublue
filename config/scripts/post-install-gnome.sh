#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Remove Unnecessary desktop entries from overview
rm -f /usr/share/applications/htop.desktop
rm -f /usr/share/applications/nvtop.desktop
rm -f /usr/share/applications/org.gnome.Extensions.desktop

# Remove repo files
# rm -f /etc/yum.repos.d/**

# mv over /etc files
cp -r "/var/lib/alternatives" "/usr/share/alternatives"

# Starship in /etc/bashrc
echo 'eval "$(starship init bash)"' >> /etc/bashrc

# Symlink Yafti
ln -s /usr/share/ublue-os/firstboot/yafti.yml /etc/yafti.yml

# Speedup Shutdown and style os-release
sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=30s/' /etc/systemd/user.conf
sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=30s/' /etc/systemd/system.conf
sed -i '/^PRETTY_NAME/s/Silverblue/m2-ublue-silverblue/' /usr/lib/os-release
