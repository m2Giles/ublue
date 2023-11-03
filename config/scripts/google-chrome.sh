#!/usr/bin/env bash

set -oue pipefail

wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -O /tmp/google-chrome.rpm
rpm-ostree install /tmp/google-chrome.rpm