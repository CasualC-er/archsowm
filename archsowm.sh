#! /bin/bash
cfdisk
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
mount /dev/sda1 /mnt
pacstrap /mnt base base-devel linux linux-firmware vim
genfstab /mnt -o /etc/fstab
arch-chroot /mnt
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
locale-gen
touch /etc/locale.conf
echo "LANG=en_US.UTF-8"
pacman -S networkmanager grub
grub-install /dev/sda
grub-mkconfig /boot/grub/grub.cfg
systemctl enable NetworkManager
pacman -S xorg git ssdm picom dmenu st nitrogen 
cd /opt
git clone https://github.com/dylanaraps/sowm
cd sowm
make install
mkdir /opt/desktops
touch sowm.sh /opt/desktops
echo "picom -b &
sudo nitrogen --restore &
exec sowm" >> /opt/desktops/sowm.sh
touch sowm.desktop /usr/share/xsessions/
echo "[Desktop Entry]
Name=SOWM
Comment=Runs sowm as desktop
Exec=opt/desktops/sowm.sh
Type=Application" >> /usr/share/xsessions/sowm.desktop
