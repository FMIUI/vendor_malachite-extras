#!/bin/bash
# Usage (from the source root): vendor/malachite-extras/integrate.sh device/xiaomi/malachite
set -e
D=${1:?usage: integrate.sh <device tree dir>}
add() { grep -qF -- "$2" "$1" || echo "$2" >> "$1"; }
add "$D/device.mk" '$(call inherit-product-if-exists, vendor/malachite-extras/malachite-extras.mk)'
add "$D/BoardConfig.mk" '-include vendor/malachite-extras/BoardConfigExtras.mk'
vendor/malachite-extras/sepolicy-patch.sh
echo "malachite-extras integrated into $D"
