# Aquarius

## Partitions

Partition                           | Mount point     | Size             | Filesystem
----------------------------------- | --------------- | ---------------- | ----------------
**System**                          |                 |                  |
/dev/nvme0n1p1                      | /boot/efi       | 512Mo            | EFI System
/dev/nvme0n1p2                      | /               | Remaining space  | xfs
/dev/nvme0n1p3                      |                 | 16Go             | swap
**Home**                            |                 |                  |
/dev/nvme1n1p1                      | /home           | The whole device | xfs
**Zodiac**                          |                 |                  |
/dev/nvme2n1p1                      | /zodiac/mnt/z10 | The whole device | xfs
/dev/sdc1                           | /zodiac/mnt/z12 | The whole device | xfs

## Symlinks and directories

```sh
sudo mkdir -p /zodiac/mnt/z{7,10,11,12}
sudo ln -sf /zodiac/mnt/z10 /zodiac/home # Z10 -> Zodiac Home
sudo ln -sf /zodiac/mnt/z12 /zodiac/bkp # Z12 -> Zodiac Backup
sudo ln -sf /zodiac/home/$USER ~/zodiac # Home -> Zodiac Home
```

## Additional scripts

- [/usr/local/bin/zodiac-mkbkp](base/usr/local/bin/zodiac-mkbkp)
