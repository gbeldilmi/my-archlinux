# Install Arch Linux

## Install essential packages

```sh
pacstrap -K /mnt base{,-devel} linux{,-firmware} intel-ucode {,un,p7}zip vim {dosfs,m}tools lsb-release ntfs-3g {exfat,xfs}progs man-{db,pages} bash-completion zsh
```

## Configure the system

```sh
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc --utc

vim /etc/vconsole.conf # KEYMAP=fr-latin9

vim /etc/hostname # hostname
```

## Install bootloader

### BIOS

```sh
pacman -S grub
grub-install --no-floppy --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

### UEFI

```sh
pacman -S grub efibootmgr
mount | grep efivars &> /dev/null || mount -t efivarfs efivarfs /sys/firmware/efi/efivars
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub --recheck
mkdir /boot/efi/EFI/boot
cp /boot/efi/EFI/grub/grubx64.efi /boot/efi/EFI/boot/bootx64.efi
grub-mkconfig -o /boot/grub/grub.cfg
```

## Create user's profile

```sh
passwd root
chsh -s /usr/bin/zsh # if you want to use zsh

visudo # #Uncomment to allow members of group wheel to execute any command
useradd -m -g wheel -c 'user' -s /usr/bin/bash user
passwd user
```

## Update initramfs and finish installation

```sh
mkinitcpio -P

exit
umount -R /mnt
shutdown now
```
