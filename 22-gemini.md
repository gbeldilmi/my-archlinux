# Gemini

## Partitions

Partition           | Mount point | Size             | Filesystem
------------------- | ----------- | ---------------- | ----------------
**System**          |             |                  |
/dev/sda1           | /boot/efi   | 512Mo            | EFI System
/dev/sda2           | /           | Remaining space  | xfs
/dev/sda3           |             | 16Go             | swap
**Home** *(RAID 5)* |             |                  |
/dev/sdb1           | /home       | The whole device | xfs
