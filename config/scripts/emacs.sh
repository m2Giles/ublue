#!/usr/bin/env bash

set -ouex pipefail

# Install from Copr
rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:stevenlin:emacs-pgtk-nativecomp emacs emacs-common emacs-filesystem

# Remove Repo
rm -f /etc/yum.repos.d/_copr_stevenlin-emacs-pgtk-nativecomp