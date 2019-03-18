$(call inherit-product, device/phh/treble/base-pre.mk)
include build/make/target/product/treble_common.mk
$(call inherit-product, vendor/vndk/vndk-binder32.mk)
$(call inherit-product, device/phh/treble/base.mk)
$(call inherit-product, device/phh/treble/gapps.mk)
$(call inherit-product, vendor/motorola/ali/ali-vendor.mk)
$(call inherit-product, device/phh/treble/descendant.mk)

PRODUCT_NAME := ali_n
PRODUCT_DEVICE := ali_n
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := moto g(6)

PRODUCT_BUILD_PROP_OVERRIDES += \
        ro.bootimage.build.fingerprint="motorola/ali_n/ali_n:9/PPS29.55-24/a37fd:user/release-keys" \
	ro.build.thumbprint="9/PPS29.55-24/a37fd:user/release-keys" \
        ro.vendor.build.fingerprint="motorola/ali/ali:8.0.0/OPSS27.104-92-2/3:user/release-keys" \
	ro.vendor.build.thumbprint="9/PPS29.55-24/a37fd:user/release-keys" \
        PRIVATE_BUILD_DESC="ali_n-user 9 PPS29.55-24 a37fd release-keys"

BUILD_FINGERPRINT := motorola/ali_n/ali_n:9/PPS29.55-24/a37fd:user/release-keys
