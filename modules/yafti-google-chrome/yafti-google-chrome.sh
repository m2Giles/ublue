#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

FIRSTBOOT_DATA="/usr/share/ublue-os/firstboot"
YAFTI_FILE="$FIRSTBOOT_DATA/yafti.yml"

get_yaml_array FLATPAKS '.google-chrome-flatpak[]' "$1"
if [[ ${#FLATPAKS[@]} -gt 0 ]]; then
    echo "Adding Google Chrome to yafti.yml"
    yq -i '.screens.applications.values.groups.Google Chrome.description = "Install Google Chrome."' "${YAFTI_FILE}"
    yq -i '.screens.applications.values.groups.Google Chrome.default = true' "${YAFTI_FILE}"

    for pkg in "${FLATPAKS[@]}"; do
        echo "Adding to yafti: ${pkg}"
        yq -i ".screens.applications.values.groups.Google Chrome.packages += [$pkg]" "${YAFTI_FILE}"
    done
fi