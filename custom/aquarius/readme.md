# gemini

## Partitions

Partition      | Mount point   | Size               | Filesystem
-------------- | ------------- | ------------------ | -----------
/dev/sda1      | /boot/efi     | 512Mo              | EFI System
/dev/sda2      | /             | Remaining space    | ext4
/dev/sda3      |               | 8Go                | swap
/dev/sdb1      | /home         | The whole device   | ext4
/dev/sdc1      | /srv          | The whole device   | ext4
