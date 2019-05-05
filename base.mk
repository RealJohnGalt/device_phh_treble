#Huawei devices don't declare fingerprint and telephony hardware feature
#TODO: Proper detection
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

#Use a more decent APN config
PRODUCT_COPY_FILES += \
    device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/phh/treble/sepolicy
DEVICE_PACKAGE_OVERLAYS += device/phh/treble/overlay

$(call inherit-product, vendor/hardware_overlay/overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

#Those overrides are here because Huawei's init read properties
#from /system/etc/prop.default, then /vendor/build.prop, then /system/build.prop
#So we need to set our props in prop.default
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.version.release=$(PLATFORM_VERSION) \
    ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH) \
    ro.adb.secure=0 \
    ro.logd.auditd=true
    
#Huawei HiSuite (also other OEM custom programs I guess) it's of no use in AOSP builds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=adb \
    ro.cust.cdrom=/dev/null 

#VNDK config files
PRODUCT_COPY_FILES += \
    device/phh/treble/vndk-detect:system/bin/vndk-detect \
    device/phh/treble/vndk.rc:system/etc/init/vndk.rc \
    device/phh/treble/ld.config.26.txt:system/etc/ld.config.26.txt \

#USB Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

# NFC:
#   Provide default libnfc-nci.conf file for devices that does not have one in
#   vendor/etc
PRODUCT_COPY_FILES += \
    device/phh/treble/nfc/libnfc-nci.conf:system/phh/libnfc-nci-oreo.conf \
    device/phh/treble/nfc/libnfc-nci-huawei.conf:system/phh/libnfc-nci-huawei.conf

# Provide PRA NFC configs
PRODUCT_COPY_FILES += \
    device/phh/treble/nfc/libnfc-nci-PRA.conf:system/phh/libnfc-nci-PRA.conf \
    device/phh/treble/nfc/libnfc-nxp-PRA.conf:system/etc/libnfc-nxp.conf \
    device/phh/treble/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# Provide NFC perms
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# Huawei HWC
PRODUCT_COPY_FILES += \
    device/phh/treble/huawei_hwc/android.hardware.graphics.composer@2.2-service:system/huawei_hwc/android.hardware.graphics.composer@2.2-service \
    device/phh/treble/huawei_hwc/hwcomposer.kirin970.so:system/huawei_hwc/hwcomposer.kirin970.so \
    device/phh/treble/huawei_hwc/libhidltransport.so:system/huawei_hwc/libhidltransport.so \
    device/phh/treble/huawei_hwc/libhwc2onfbadapter.so:system/huawei_hwc/libhwc2onfbadapter.so \
    device/phh/treble/huawei_hwc/libperfgenius_vendor_client.so:system/huawei_hwc/libperfgenius_vendor_client.so \
    device/phh/treble/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.0.so:system/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.0.so \
    device/phh/treble/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.1.so:system/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.1.so \
    device/phh/treble/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.2.so:system/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.2.so \
    device/phh/treble/huawei_hwc/vendor.huawei.hardware.perfgenius@2.0.so:system/huawei_hwc/vendor.huawei.hardware.perfgenius@2.0.so

# LineageOS build may need this to make NFC work
#PRODUCT_PACKAGES += \
#        NfcNci  

PRODUCT_COPY_FILES += \
    device/phh/treble/rw-system.sh:system/bin/rw-system.sh \
    device/phh/treble/basic-integrity.sh:system/bin/basic-integrity.sh \
    device/phh/treble/fixSPL/getSPL.arm:system/bin/getSPL

PRODUCT_COPY_FILES += \
    device/phh/treble/empty:system/phh/empty \
    device/phh/treble/huawei_hwc/huawei_hwc.sh:system/bin/huawei_hwc.sh \
    device/phh/treble/magisk_adb.sh:system/bin/magisk_adb.sh \
    device/phh/treble/phh-on-boot.sh:system/bin/phh-on-boot.sh

PRODUCT_PACKAGES += \
    treble-environ-rc

PRODUCT_PACKAGES += \
    bootctl \
    vintf

PRODUCT_COPY_FILES += \
    device/phh/treble/twrp/twrp.rc:system/etc/init/twrp.rc \
    device/phh/treble/twrp/twrp.sh:system/bin/twrp.sh \
    device/phh/treble/twrp/busybox-armv7l:system/bin/busybox_phh

PRODUCT_PACKAGES += \
    simg2img_simple

ifneq (,$(wildcard external/exfat))
PRODUCT_PACKAGES += \
    mkfs.exfat \
    fsck.exfat
endif

PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd-V1.0-java \
    vendor.huawei.hardware.biometrics.fingerprint-V2.1-java \
    vendor.huawei.hardware.tp-V1.0-java \
    vendor.qti.hardware.radio.am-V1.0-java \
    vendor.qti.qcril.am-V1.0-java \

PRODUCT_COPY_FILES += \
    device/phh/treble/interfaces.xml:system/etc/permissions/interfaces.xml

PRODUCT_COPY_FILES += \
    device/phh/treble/files/samsung-gpio_keys.kl:system/phh/samsung-gpio_keys.kl \
    device/phh/treble/files/samsung-sec_touchscreen.kl:system/phh/samsung-sec_touchscreen.kl \
    device/phh/treble/files/oneplus6-synaptics_s3320.kl:system/phh/oneplus6-synaptics_s3320.kl \
    device/phh/treble/files/huawei-fingerprint.kl:system/phh/huawei/fingerprint.kl \
    device/phh/treble/files/samsung-sec_e-pen.idc:system/usr/idc/sec_e-pen.idc \
    device/phh/treble/files/samsung-9810-floating_feature.xml:system/ph/sam-9810-flo_feat.xml \
    device/phh/treble/files/uinput-fpc.idc:system/usr/idc/uinput-fpc.idc \
    device/phh/treble/files/uinput-fpc.kl:system/usr/keylayout/uinput-fpc.kl \
    device/phh/treble/files/mimix3-gpio-keys.kl:system/phh/mimix3-gpio-keys.kl

SELINUX_IGNORE_NEVERALLOWS := true

# Universal NoCutoutOverlay
PRODUCT_PACKAGES += \
    NoCutoutOverlay

PRODUCT_PACKAGES += \
    lightsctl \
    uevent

PRODUCT_COPY_FILES += \
    device/phh/treble/files/adbd.rc:system/etc/init/adbd.rc

# Offline charging for Huawei
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/phh/treble/huawei_charger,system/etc/charger)

#MTK incoming SMS fix
PRODUCT_PACKAGES += \
	mtk-sms-fwk-ready
