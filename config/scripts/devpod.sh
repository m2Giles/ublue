#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

wget https://github.com/loft-sh/devpod/releases/latest/download/DevPod_linux_x86_64.tar.gz -O /tmp/devpod.tar.gz
tar -xvf /tmp/devpod.tar.gz -C /
