# Aquarius

## Partitions

Partition                      | Mount point | Size             | Filesystem
------------------------------ | ----------- | ---------------- | ----------------
**System**                     |             |                  |
/dev/nvme0n1p1                 | /boot/efi   | 512Mo            | EFI System
/dev/nvme0n1p2                 | /           | Remaining space  | ext4
/dev/nvme0n1p3                 |             | 16Go             | swap
**Home**                       |             |                  |
/dev/nvme1n1p1                 | /home       | The whole device | ext4
**External**                   |             |                  |
/dev/sda1                      | /ext/a10    | The whole device | ext4
/dev/sdb1                      | /ext/b10    | The whole device | ext4
**Zodiac**                     |             |                  |
/dev/sdc1 */dev/mapper/zodiac* | /zodiac     | The whole device | ext4 (Encrypted)
