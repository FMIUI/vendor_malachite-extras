# vendor_malachite-extras

For POCO X7 (malachite): **Malachite Parts** (CPU/GPU/thermal/touch/ZRAM/display controls), **Xiaomi CIT**
(factory tests, with its factory HAL, configs and the MediaTek telephony classes it needs) and the
**Goodix FOD test**, plus `malachited`, which lets Parts change kernel settings on **user builds without root**.
Works on Android 16 and 17 trees.

## Integrate

1. Local manifest (`.repo/local_manifests/malachite-extras.xml`):

       <manifest>
         <remote name="fmiui" fetch="https://github.com/FMIUI" />
         <project path="vendor/malachite-extras" name="vendor_malachite-extras" remote="fmiui" revision="main" />
       </manifest>

2. Device tree:

       # device.mk
       $(call inherit-product-if-exists, vendor/malachite-extras/malachite-extras.mk)
       # BoardConfig.mk
       -include vendor/malachite-extras/BoardConfigExtras.mk

3. Build as usual, then verify:

       bash vendor/malachite-extras/check.sh

The build patches `system/sepolicy` (adds the `malachited` domain) and the Goodix/GPS blobs itself on every build,
and picks the right SELinux files for your Android version. All APKs are re-signed with your platform key.

## Notes

- Blobs are expected at `vendor/xiaomi/malachite`. The GPS fix (`libmnk`) needs blobs that ship MediaTek's
  `libmnl` as `libmnk` (FMIUI/proprietary_vendor_xiaomi_malachite does).
- CIT opens through `*#*#6484#*#*` or the CIT button in Parts. Its fingerprint test resets enrolled fingerprints,
  as on stock.
- Touch 1000 Hz in Parts needs root (KernelSU), everything else works without it.
