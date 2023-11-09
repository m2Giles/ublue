#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -xoue pipefail
 
git clone https://github.com/forge-ext/forge.git /tmp/forge
cd /tmp/forge
make INSTALL_PATH=/usr/share/gnome-shell/extensions/forge@jmmaranan.com install
install -Dm644 schemas/org.gnome.shell.extensions.forge.gschema.xml -t \
    "/usr/share/glib-2.0/schemas/"