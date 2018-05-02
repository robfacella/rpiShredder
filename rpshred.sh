#!/usr/bin/bash
echo "Be very careful."
echo "This program is designed to run shred over all USB devices attached to a Raspberry Pi. (All /dev/sd* devices.)"
echo "Do not run this if you do not understand what it does or how it works."
echo "I will not be held responsible for data-loss due to misuse."
echo "root permissions required"

for drive in ` df | grep /dev/sd | awk '{ variable = sprintf("%-.8s", $1); print variable}'`
do
  echo "Overwrite $drive with 0s:"
  shred -fvz -n 0 $drive
done
