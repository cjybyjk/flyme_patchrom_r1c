#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11644928 20d4eb2d602d4781e646e221b06dd90df159dad4 9211904 6579112c4c3ea6f77263124c1c8f0893c07dd5ff
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:11644928:20d4eb2d602d4781e646e221b06dd90df159dad4; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:9211904:6579112c4c3ea6f77263124c1c8f0893c07dd5ff EMMC:/dev/block/bootdevice/by-name/recovery 20d4eb2d602d4781e646e221b06dd90df159dad4 11644928 6579112c4c3ea6f77263124c1c8f0893c07dd5ff:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
