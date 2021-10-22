#!/usr/bin/bash
start=`date +%s`
echo "Be very careful."
echo "This program is designed to run shred over all USB devices attached to a Raspberry Pi. (All /dev/sd* devices.)"
echo "Do not run this if you do not understand what it does or how it works."
echo "I will not be held responsible for data-loss due to misuse."
echo "root permissions required for using shred on entire devices and for reformatting."

for drive in ` df | grep /dev/sd | awk '{ variable = sprintf("%-.8s", $1); print variable}' | uniq`
do
  echo "Overwrite $drive with 0s:"
  shred -fvz -n 0 $drive
  unmount
  umount `df | grep $drive | awk '{print $6}'`
  parted $drive mklabel msdos
  parted $drive mkpart primary fat32 0% 100%
  mkfs -t vfat "$drive""1"
done

end=`date +%s`
runtime=$((end-start))
echo "Total Runtime in seconds: $runtime"

