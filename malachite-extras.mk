PRODUCT_SOONG_NAMESPACES += vendor/malachite-extras

PRODUCT_PACKAGES += \
    MalachiteParts \
    MMIGroup_NoIcon \
    goodix_sz \
    malachited \
    interfaces.factoryInterface@1.0-service

# CIT test configs read by the factory service and the CIT app
PRODUCT_COPY_FILES += $(foreach f,$(shell cd vendor/malachite-extras/factory/mmigroup && find . -type f | sed 's|^\./||'),\
    vendor/malachite-extras/factory/mmigroup/$(f):$(TARGET_COPY_OUT_VENDOR)/etc/mmigroup/$(f))

# MediaTek telephony classes CIT needs, loaded only by CIT
PRODUCT_PACKAGES += mediatek-ims-base-cit mediatek-telephony-base-cit cit-mtk-libs.xml
