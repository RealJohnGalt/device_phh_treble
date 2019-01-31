#!/system/bin/sh
sed 's/ORANGE/GREEN/i' /proc/cmdline | sed 's/YELLOW/GREEN/i' > /data/local/tmp/cmdline && mount -o bind /data/local/tmp/cmdline /proc/cmdline
