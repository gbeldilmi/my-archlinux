# gemini

## Partitions

Partition      | Mount point   | Size               | Filesystem
-------------- | ------------- | ------------------ | -----------
/dev/sda1      | /boot/efi     | 512Mo              | EFI System
/dev/sda2      | /             | Remaining space    | ext4
/dev/sda3      |               | 16Go               | swap
/dev/sdb1      | /zodiac       | The whole device   | ext4
/dev/nvme0n1p1 | /zodiac/save  | The whole device   | ext4

## Directories and symlinks

```sh
mkdir -p /zodiac/{save,home{,/library,/workspace}}
ln -sf /zodiac/home/library ~/library
ln -sf /zodiac/home/workspace ~/workspace

ln -sf /zodiac/home/library/projects /srv/git
# on client : git clone user@gemini:/srv/git/<repo>.git

ln -sf /zodiac /srv/zodiac # NFS
```
