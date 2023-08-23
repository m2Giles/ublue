#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

wget https://terra.fyralabs.com/terra.repo -O /etc/yum.repos.d/terra.repo
