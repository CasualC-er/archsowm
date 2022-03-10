#! /bin/bash
echo "en_US.UTF-8 UTF-8
en_US ISO-8859-1" > /etc/locale.gen
touch /etc/locale.conf
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen
pacman -S networkmanager grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
pacman -S xorg git sddm picom dmenu nitrogen 
systemctl enable sddm
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
passwd