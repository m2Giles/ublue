#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail
 
wget https://github.com/oae/gnome-shell-pano/releases/latest/download/pano@elhan.io.zip -O /tmp/pano@elhan.io.zip
unzip /tmp/pano@elhan.io.zip -d /usr/share/gnome-shell/extensions/pano@elhan.io