# rpiShredder
Shred all USB drives attached to a Raspberry Pi.

Information Security is a valuable thing.
I had an idle Rasperry Pi 3 so I decided to put it to use as a USB-Sanitizer.

I could manually do the cleaning but it seemed like a nice idea to have a quick and dirty script to do the job.
Due to the Rasperry Pi's limited processing power, I have written the script to only do the final pass of shred. That being overwriting all bits to zero.

This script shreds all /dev/sd* devices.
The Raspberry Pi's main storage is not /dev/sda.
If you ran this on a desktop you would shred your hard drive, so don't do that.

I am not responsible for data-loss due to the misuse of this program.
