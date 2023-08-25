#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

rpm-ostree install $(curl https://api.github.com/repos/loft-sh/devpod/releases/latest | jq -r '.assets[] | select(.name| test(".*x86_64.rpm$")).browser_download_url') 
wget https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64 -O /tmp/devpod
install -c -m 0755 /tmp/devpod /usr/bin