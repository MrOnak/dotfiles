# boot from USB

This will only work if the SD card is _not_ inserted, as the boot order still
priorizes the SD card. This is useful as an (emergency) fallback.

1. make sure we have the latest RPi firmware: `sudo rpi-eeprom-update`
2. If needed, update the firmware: `sudo rpi-eeprom-update -a`
3. Verify boot order: `rpi-eeprom-config`. The output should include `BOOT_ORDER=0xf41`

0xf41 is read from right to left and indicates:

1. attempt to boot from SD card first (1)
2. attempt to boot from USB (4)
3. repeat (f)

Useful trick: To see if the boot from USB generally works, plug the known-to-work
SD card into a usb-cardreader - the Pi will boot from there after it determines
that the SD card slot is empty.

Now to get the partitions from the SD card to the USB drive:

* `git clone https://github.com/billw2/rpi-clone`
* find the device-id of the USB drive: `lsblk -o NAME,SIZE,MOUNTPOINTS,LABEL`
* now we can clone the sd card to the USB drive: `sudo rpi-clone sdX`

Once this completes we need to assign labels to the new partitions:
* for the root filesystem (ext4): `sudo e2label /dev/sdX2 NEW_LABEL`
* for the boot partition (vfat): `sudo fatlabel /dev/sdX1 NEW_LABEL`

Until now, the boot files will still attempt to boot partitions by the labels
used on the SD card. We need to change this:

In `/boot/firmware/cmdline.txt` change the part `root=LABEL=somelabel` to whatever
you used to label the root partition of the USB drive.

In `/etc/fstab` change labels for both partitions mounted at `/` and `/boot/filesystem`

That should be it!




