# Gemini

## Partitions

Partition                           | Mount point | Size             | Filesystem
----------------------------------- | ----------- | ---------------- | ----------------
**System**                          |             |                  |
/dev/sda1                           | /boot/efi   | 512Mo            | EFI System
/dev/sda2                           | /           | Remaining space  | ext4
/dev/sda3                           |             | 16Go             | swap
**Home**                            |             |                  |
/dev/sdb1                           | /home       | The whole device | ext4
**External Drive**                  |             |                  |
/dev/nvme0n1p1                      | /ext        | The whole device | ext4
