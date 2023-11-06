#!/usr/bin/env bash

set -ouex pipefail

echo "Setting up Directories for opt and alternatives"
mkdir -p /var/opt
mkdir -p /var/lib/alternatives