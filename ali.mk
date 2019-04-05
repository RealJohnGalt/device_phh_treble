$(call inherit-product, device/phh/treble/base-pre.mk)
include build/make/target/product/treble_common.mk
$(call inherit-product, vendor/vndk/vndk-binder32.mk)
$(call inherit-product, device/phh/treble/base.mk)
$(call inherit-product, device/phh/treble/gapps.mk)
$(call inherit-product, vendor/motorola/ali/ali-vendor.mk)
$(call inherit-product, device/phh/treble/descendant.mk)
$(call inherit-product, device/qcom/sepolicy/sepolicy.mk)

PRODUCT_NAME := ali
PRODUCT_DEVICE := ali
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := moto g(6)
TARGET_BOARD_PLATFORM := msm8953

PRODUCT_BUILD_PROP_OVERRIDES += \
	ro.bootimage.build.fingerprint="motorola/ali/ali:9/PPS29.55-24/a37fd:user/release-keys" \
	ro.build.thumbprint="9/PPS29.55-24/a37fd:user/release-keys" \
        ro.vendor.build.fingerprint="motorola/ali/ali:9/PPS29.55-24/a37fd:user/release-keys" \
	ro.vendor.build.thumbprint="9/PPS29.55-24/a37fd:user/release-keys" \
        PRIVATE_BUILD_DESC="ali-user 9 PPS29.55-24 a37fd release-keys"

BUILD_FINGERPRINT := motorola/ali/ali:9/PPS29.55-24/a37fd:user/release-keys

PRODUCT_PACKAGES += \
    ims-ext-common \
    telephony-ext \
    Stk

PRODUCT_BOOT_JARS += \
    telephony-ext
