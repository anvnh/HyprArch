# If dual boot, enable window boot 
if [ -d /sys/firmware/efi/efivars ]; then
    # Go to /etc/default/grub and change GRUB_TIMEOUT=5 to GRUB_TIMEOUT=30 and add line GRUB_DISABLE_OS_PROBER=false at the end of file
    sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=30/' /etc/default/grub
    sudo sed -i '$aGRUB_DISABLE_OS_PROBER=false' /etc/default/grub
    sudo pacman -Sy os-prober
    sudo grub-mkconfig -o /boot/grub/grub.cfg
fi
