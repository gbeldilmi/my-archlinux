# archlinux-base

## Set the keyboard layout

```sh
loadkeys fr
```

## Connect to the internet

Connect to a wifi network if necessary with `iwctl`.

```sh
timedatectl set-ntp true
```

## Partitions

### BIOS

Partition            | Mount point | Size
-------------------- | ----------- | ------------------
/dev/sda1 (bootable) | /boot       | 512Mo
/dev/sda2            | /           | Remaining space
/dev/sda3            |             | RAM size (max 8Go)
/dev/sdb1 (optional) | /home       | The whole device

```sh
fdisk -l # Results ending in rom, loop or airoot may be ignored

cfdisk /dev/sda
# cfdisk /dev/sdb

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3
# mkfs.ext4 /dev/sdb1

mount /dev/sda2 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
# mount /dev/sdb1 /mnt/home
```

### UEFI

Code | Partition            | Mount point | Size                                    | Description
---- | -------------------- | ----------- | --------------------------------------- | ----------------
ef00 | /dev/sda1            | /boot/efi   | 512Mo                                   | EFI System
8300 | /dev/sda2            | /           | Remaining space                         | Linux filesystem
8200 | /dev/sda3            |             | RAM size (max 8Go, 16Go if RAM > 128Go) | Linux swap
8300 | /dev/sdb1 (optional) | /home       | The whole device                        | Linux filesystem

```sh
fdisk -l # Results ending in rom, loop or airoot may be ignored

cgdisk /dev/sda
# cgdisk /dev/sdb

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3
# mkfs.ext4 /dev/sdb1

mount /dev/sda2 /mnt
mkdir /mnt/{boot{,/efi},home}
mount /dev/sda1 /mnt/boot/efi
# mount /dev/sdb1 /mnt/home
```

## Install essential packages

```sh
pacstrap -K /mnt base{,-devel} linux{,-firmware} intel-ucode grub {,un,p7}zip vim {dosfs,m}tools lsb-release ntfs-3g exfat-utils bash-completion man-{db,pages} texinfo # efibootmgr (for UEFI)
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

## Install GRUB

### BIOS

```sh
grub-install --no-floppy --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

### UEFI

```sh
mount | grep efivars &> /dev/null || mount -t efivarfs efivarfs /sys/firmware/efi/efivars
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub --recheck
mkdir /boot/efi/EFI/boot
cp /boot/efi/EFI/grub/grubx64.efi /boot/efi/EFI/boot/bootx64.efi
grub-mkconfig -o /boot/grub/grub.cfg
```

## Install packages and enable services

```sh
pacman -Syy syslog-ng cronie ntp openssh

vim /etc/systemd/journald.conf # #ForwardToSyslog=no -> ForwardToSyslog=yes
vim /etc/ssh/sshd_config # AllowUsers user

systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl enable syslog-ng@default
systemctl enable cronie
systemctl enable ntpd
systemctl enable sshd
```

Install all packages from the [package list](common/package-list.txt) with `pacman -S [packages]`.

Show system information when logging in.

```sh
echo "neofetch" >> /etc/profile
```

## Wireless network

```sh
pacman -S iwd
systemctl enable iwd
```

Later, on post-installation, connect to a wifi network with `iwctl`.

## Network bonding

[cf. `/etc/systemd/network/`](common/etc/systemd/network/)

## Create user's profile

```sh
passwd root

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

## Post-installation

### Git

```sh
git config --global init.defaultBranch dev
git config --global user.name user
git config --global user.email ""
git config --global core.editor vim
git config --global core.eol lf
git config --global core.autocrlf input
sudo git config --system receive.fsckObjects true
```

### WireGuard (client)

[cf. `/etc/wireguard/wg0.conf`](common/etc/wireguard/wg0.conf)

```sh
wg genkey | sudo tee /etc/wireguard/wg0-private.key | wg pubkey | sudo tee /etc/wireguard/wg0-public.key
sudo vim /etc/wireguard/wg0.conf
sudo systemctl start wg-quick@wg0.service
sudo systemctl enable wg-quick@wg0.service
```

### NFS

```sh
ln -sf /shared /srv/shared

vim /etc/exports # /srv/shared  10.0.0.0/8(rw,sync,anonuid=65534,anongid=65534,no_subtree_check,crossmnt,nohide) # fsid=0

vim /etc/hosts.allow # ALL: 10.*.*.*
vim /etc/hosts.deny # ALL: ALL

systemctl enable nfs-server.service
exportfs -arv
```
