#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

wget https://github.com/loft-sh/devpod/releases/latest/download/DevPod_linux_x86_64.tar.gz -O /tmp/devpod.tar.gz
mkdir /tmp/devpod-package
tar -xvf /tmp/devpod.tar.gz -C /tmp/devpod
cp /tmp/devpod-package/usr/bin/{dev-pod,devpod-cli} /usr/bin/
cp /tmp/devpod-package/usr/share/applications/** /usr/share/applications/
cp /tmp/devpod-package/usr/share/glib-2.0/** /usr/share/glib-2.0/
cp /tmp/devpod-package/usr/share/icons/** /usr/share/icons/
curl -L -o /tmp/devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64"
install -c -m 0755 /tmp/devpod /usr/bin
