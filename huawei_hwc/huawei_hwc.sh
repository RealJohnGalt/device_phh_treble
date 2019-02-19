#!/system/bin/sh

vndk="$(getprop persist.sys.vndk)"
hwcpath=$(find /vendor/lib64/hw/ -name "*hwcomposer*")

if [ "$vndk" == 27 -o "$vndk" == 26 ];then
    if echo "$hwcpath" | grep -qE "hi6250|hi3660" ;then
        mount -o bind /system/huawei_hwc/hwcomposer.kirin970.so $hwcpath
        setprop ctl.stop hwcomposer-2-1
        LD_LIBRARY_PATH=/system/huawei_hwc/ /system/huawei_hwc/android.hardware.graphics.composer@2.2-service
    fi
fi

