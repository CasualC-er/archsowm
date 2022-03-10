#! /bin/bash
cfdisk
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
mount /dev/sda2 /mnt
pacstrap /mnt base base-devel linux linux-firmware vim
genfstab -U /mnt -o /etc/fstab
arch-chroot /mnt