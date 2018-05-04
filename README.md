# rpiShredder
Shred all USB drives attached to a Raspberry Pi.

Information Security is a valuable thing.  
I had an idle Rasperry Pi 3, so I decided to put it to use as a USB-Sanitizer. 

Generates a list of /dev/sd* devices. 
Iterates only over unique entries. (Entire storage volumes rather than individual partitions.) 
Writes nulls to all bits on a disk. 
Unmounts disk. 
Creates an msdos label for the volume. 
Creates a new, single, FAT32 partition occuping the whole writable disk.  
Generates a vfat file system on the disk. 

Device is ready for safe removal and is ready for general use.

Notes:  
Due to the Rasperry Pi's limited processing power, I have written the script to only do the final pass of shred. That being overwriting all bits to zero.

This script shreds all /dev/sd* devices.  
The Raspberry Pi's main storage is not /dev/sda.  
If you ran this on a desktop you would shred your hard drive, so don't do that. 

I am not responsible for data-loss due to the misuse of this program.  
