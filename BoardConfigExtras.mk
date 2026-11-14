BOARD_VENDOR_SEPOLICY_DIRS += vendor/malachite-extras/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += vendor/malachite-extras/sepolicy/system_ext

# Xiaomi factory HALs (CIT) are device-specific: declare them for the VINTF check
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/malachite-extras/factory/factory_fcm.xml
