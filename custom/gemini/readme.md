# gemini

## Partitions

Partition                      | Mount point   | Size               | Filesystem
------------------------------ | ------------- | ------------------ | ----------------
**System** *(SAS 0)*           |               | **1To**            |
/dev/sda1                      | /boot/efi     | 512Mo              | EFI System
/dev/sda2                      | /             | Remaining space    | ext4
/dev/sda3                      |               | 16Go               | swap
**Backup** *(SAS 1)*           |               | **4To**            |
/dev/sdb1 */dev/mapper/backup* | /backup       | The whole device   | ext4 (Encrypted)
**Data** *(SAS 3-7)*           |               | **4To** *RAID 5*   |
/dev/sdc1 */dev/mapper/zodiac* | /zodiac       | The whole device   | ext4 (Encrypted)

### Encrypted partitions

Create encrypted partitions:

```sh
sudo cryptsetup luksFormat /dev/sdb1
sudo cryptsetup luksFormat /dev/sdc1
```

Add key to encrypted partitions and key path to environment:

```sh
sudo vim /etc/environment # ZODIAC_KEY=/path/to/key
sudo cryptsetup luksAddKey /dev/sdb1 /path/to/key
sudo cryptsetup luksAddKey /dev/sdc1 /path/to/key
```

Open and format encrypted partitions:

```sh
sudo cryptsetup luksOpen /dev/sdb1 backup
sudo cryptsetup luksOpen /dev/sdc1 zodiac

sudo mkfs.ext4 /dev/mapper/backup
sudo mkfs.ext4 /dev/mapper/zodiac

sudo mount /dev/mapper/backup /backup
sudo mount /dev/mapper/zodiac /zodiac
```

## Directories and symlinks

```sh
mkdir -p /zodiac/library
sudo ln -sf /zodiac/library ~/library

sudo ln -sf /zodiac/library/projects /srv/git
# on client : git clone user@gemini:/srv/git/<repo>.git

sudo ln -sf /zodiac /srv/zodiac # NFS
```

## Services

```sh
sudo systemctl enable zodiac-init.service
```
