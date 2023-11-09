#!/usr/bin/env bash

set -ouex pipefail

echo "Setting up Directories alternatives"
mkdir -p /var/lib/alternatives
echo "Getting Google Signing Key"
curl --retry 3 --retry-delay 2 --retry-all-errors -sL \
  -o /etc/pki/rpm-gpg/RPM-GPG-KEY-google \
  https://dl.google.com/linux/linux_signing_key.pub
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-google
rpm --import https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key