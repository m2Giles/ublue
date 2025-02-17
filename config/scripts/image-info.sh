#!/usr/bin/env bash

set -oue pipefail

IMAGE_INFO="/usr/share/ublue-os/image-info.json"
IMAGE_REF="ostree-image-signed:docker://ghcr.io/$IMAGE_VENDOR/$IMAGE_NAME"

# case $FEDORA_MAJOR_VERSION in
#   38)
#     IMAGE_TAG="gts"
#     ;;
#   *)
#     IMAGE_TAG="$FEDORA_MAJOR_VERSION"
#     ;;
# esac
# "image-tag":"$IMAGE_TAG",

cat > $IMAGE_INFO <<EOF
{
  "image-name": "$IMAGE_NAME",
  "image-flavor": "$IMAGE_FLAVOR",
  "image-vendor": "$IMAGE_VENDOR",
  "image-ref": "$IMAGE_REF",
  "base-image-name": "$BASE_IMAGE_NAME",
  "fedora-version": "$FEDORA_MAJOR_VERSION"
}
EOF