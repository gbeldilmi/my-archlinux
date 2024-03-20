# aquarius

## Partitions

Partition                      | Mount point   | Size               | Filesystem
------------------------------ | ------------- | ------------------ | ----------------
**System**                     |               | **1To**            |
/dev/sda1                      | /boot/efi     | 512Mo              | EFI System
/dev/sda2                      | /             | Remaining space    | ext4
/dev/sda3                      |               | 8Go                | swap
**Data**                       |               | **2To**            |
/dev/sdb1 */dev/mapper/zodiac* | /zodiac       | The whole device   | ext4 (Encrypted)
**Backup**                     |               | **4To**            |
/dev/sdc1 */dev/mapper/backup* | /backup       | The whole device   | ext4 (Encrypted)

### Encrypted partitions

```sh
sudo cryptsetup luksFormat /dev/sdb1
sudo cryptsetup luksFormat /dev/sdc1

sudo cryptsetup luksOpen /dev/sdb1 zodiac
sudo cryptsetup luksOpen /dev/sdc1 backup

sudo mkfs.ext4 /dev/mapper/zodiac
sudo mkfs.ext4 /dev/mapper/backup

sudo mount /dev/mapper/zodiac /zodiac
sudo mount /dev/mapper/backup /backup
```

## Directories and symlinks

```sh
mkdir -p /zodiac/library
ln -sf /zodiac/library ~/library

ln -sf /zodiac/library/projects /srv/git
# on client : git clone user@aquarius:/srv/git/<repo>.git

ln -sf /zodiac /srv/zodiac # NFS
```
