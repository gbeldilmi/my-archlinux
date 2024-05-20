# Partition the disks

## System partitions

*from archiso*

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

## Encrypted partitions

Create encrypted partitions:

```sh
sudo cryptsetup luksFormat /dev/sdc1
```

Add key to encrypted partitions and key path to environment:

```sh
sudo cryptsetup luksAddKey /dev/sdc1 /path/to/key
```

Open and format encrypted partitions:

```sh
sudo cryptsetup luksOpen /dev/sdc1 encrypted

sudo mkfs.ext4 /dev/mapper/encrypted

sudo mount /dev/mapper/encrypted /mountpoint
```
