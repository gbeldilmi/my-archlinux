# Gemini

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
