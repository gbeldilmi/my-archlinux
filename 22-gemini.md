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

## Workspace

```sh
mkdir -p ~/workspace
```

## Additionnal scripts and services

- [cf. `/usr/local/bin/save-workspace`](gemini/usr/local/bin/save-workspace)
