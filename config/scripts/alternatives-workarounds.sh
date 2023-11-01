#!/usr/bin/env bash

set -oeux pipefail

# alternatives cannot create symlinks on its own during a container build

# LD
ln -sf /usr/bin/ld.bfd /etc/alternatives/ld && ln -sf /etc/alternatives/ld /usr/bin/ld

# Emacs
# ln -sf /usr/bin/emacs-* /etc/alternatives/emacs && ln -sf /etc/alternatives/emacs /usr/bin/emacs
# ln -sf /usr/bin/etags.emacs /etc/alternatives/emacs.etags && ln -sf /etc/alternatives/emacs.etags /usr/bin/etags
# ln -sf /usr/share/man/man1/etags.emacs.1.gz /etc/alternatives/emacs.etags.man && ln -sf /etc/alternatives/emacs.etags.man /usr/share/man/man1/etags.1.gz