BOARD_VENDOR_SEPOLICY_DIRS += vendor/malachite-extras/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += vendor/malachite-extras/sepolicy/system_ext

# Xiaomi factory HALs (CIT) are device-specific: declare them for the VINTF check
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/malachite-extras/factory/factory_fcm.xml

# Android 17 groups platform apps under platform_app_all; older releases only have platform_app.
ifneq ($(shell grep -s "^attribute platform_app_all;" system/sepolicy/public/attributes),)
BOARD_VENDOR_SEPOLICY_DIRS += vendor/malachite-extras/sepolicy/vendor_apps/a17
else
BOARD_VENDOR_SEPOLICY_DIRS += vendor/malachite-extras/sepolicy/vendor_apps/legacy
endif

# Re-applied on every build so a repo sync never silently drops them. Both are idempotent.
MALACHITE_EXTRAS_PATCHED := $(shell bash vendor/malachite-extras/sepolicy-patch.sh >/dev/null 2>&1; bash vendor/malachite-extras/patch-blobs.sh)
