# gemini

## Partitions

Partition                         | Mount point   | Size               | Filesystem
--------------------------------- | ------------- | ------------------ | ----------------
**SAS 0 : System**                |               | **1To**            |
/dev/sda1                         | /boot/efi     | 512Mo              | EFI System
/dev/sda2                         | /             | Remaining space    | ext4
/dev/sda3                         |               | 16Go               | swap
**SAS 1 : Backup**                |               | **4To**            |
/dev/sdb1                         | /save         | The whole device   | ext4
**SAS 2-7 : Data *(Raid 5/6)***   |               |                    |
/dev/sdc1 */dev/mapper/zodiac*    | /zodiac       | The whole device   | ext4 (Encrypted)

## Encrypted partition

```sh
sudo cryptsetup luksFormat /dev/sdc1
sudo cryptsetup luksOpen /dev/sdc1 zodiac
sudo mkfs.ext4 /dev/mapper/zodiac
sudo mount /dev/mapper/zodiac /zodiac
```


## Directories and symlinks

```sh
mkdir -p /zodiac/{home{,/library,/workspace}}
ln -sf /zodiac/home/library ~/library
ln -sf /zodiac/home/workspace ~/workspace

ln -sf /zodiac/home/library/projects /srv/git
# on client : git clone user@gemini:/srv/git/<repo>.git

ln -sf /zodiac /srv/zodiac # NFS
```
