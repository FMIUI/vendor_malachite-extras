#!/bin/bash
# Idempotent blob fixes for malachite. Safe on already-patched blobs.
B=vendor/xiaomi/malachite/proprietary/vendor
# Goodix FOD HAL: point it at /dev/gf_disp_param (created by malachited.rc). Same length, verified.
H=$B/lib64/hw/fingerprint.goodix_fod.default.so
if [ -f "$H" ] && grep -q "/sys/class/drm/card0-DSI-1/disp_param" "$H"; then
  S=$(stat -c %s "$H")
  perl -pi -e 's#/sys/class/drm/card0-DSI-1/disp_param#"/dev/gf_disp_param" . ("\x00" x 19)#ge' "$H"
  [ "$(stat -c %s "$H")" = "$S" ] || { echo "malachite-extras: Goodix HAL size changed, restore it from git" >&2; exit 1; }
fi
# GPS: MediaTek's libmnl clashes with AOSP's netlink libmnl. Only when the blobs ship it as libmnk.
M=$B/bin/mnld
if [ -f "$M" ] && grep -qs "libmnk" vendor/xiaomi/malachite/Android.bp && grep -q "libmnl.so" "$M"; then
  perl -pi -e 's/libmnl\.so/libmnk.so/g' "$M"
fi
exit 0
