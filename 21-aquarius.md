# Aquarius

## Partitions

Partition                           | Mount point | Size             | Filesystem
----------------------------------- | ----------- | ---------------- | ----------------
**System**                          |             |                  |
/dev/nvme0n1p1                      | /boot/efi   | 512Mo            | EFI System
/dev/nvme0n1p2                      | /           | Remaining space  | ext4
/dev/nvme0n1p3                      |             | 16Go             | swap
**Home**                            |             |                  |
/dev/sda1                           | /home       | The whole device | ext4
**External Drive**                  |             |                  |
/dev/sdb1                           | /ext        | The whole device | ext4
**Zodiac**                          |             |                  |
/dev/nvme1n1p1 */dev/mapper/zodiac* | /zodiac     | The whole device | ext4 (Encrypted)
**Backup**                          |             |                  |
/dev/sdc1 */dev/mapper/backup*      | /backup     | The whole device | ext4 (Encrypted)

## Links and directories

```sh
sudo mkdir /zext                              # External drive for backups

sudo ln -sf /zodiac /srv/zodiac               # NFS (Zodiac)

sudo ln -sf /zodiac/$USER ~/zodiac            # Home -> Zodiac
```

## Environment

```sh
sudo blkid

sudo vim /etc/environment
```

```sh
# /etc/environment
KEY_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ZODIAC_KEY=path/to/key
ZODIAC_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ZEXT_KEY=path/to/key
ZEXT_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
BACKUP_KEY=path/to/key
BACKUP_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

## Additionnal scripts and services

- [cf. `/etc/systemd/system/zodiac-open.service`](aquarius/etc/systemd/system/zodiac-open.service)
- [cf. `/usr/local/bin/zodiac-open`](aquarius/usr/local/bin/zodiac-open)
- [cf. `/usr/local/bin/zodiac-close`](aquarius/usr/local/bin/zodiac-close)
- [cf. `/usr/local/bin/zodiac-save`](aquarius/usr/local/bin/zodiac-save)

```sh
sudo systemctl enable zodiac-open.service
```
