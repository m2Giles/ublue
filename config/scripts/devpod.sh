#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

wget https://github.com/loft-sh/devpod/releases/download/v0.3.7/DevPod_linux_x86_64.rpm -O /tmp/DevPod_linux_x86_64.rpm
rpm-ostree install /tmp/DevPod_linux_x86_64.rpm
wget https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64 -O /tmp/devpod
install -c -m 0755 /tmp/devpod /usr/bin