# Zodiac

Zodiac is a NFS share served on a wireguard network.

- [cf. WireGuard configuration](14-wireguard.md)

## Client

### Scripts and services

- [cf. `/etc/systemd/system/zodiac-mount.service`](base/etc/systemd/system/zodiac-mount.service)
- [cf. `/etc/systemd/system/zodiac-umount.service`](base/etc/systemd/system/zodiac-umount.service)
- [cf. `/usr/local/bin/zodiac-mount`](base/usr/local/bin/zodiac-mount)
- [cf. `/usr/local/bin/zodiac-umount`](base/usr/local/bin/zodiac-umount)

```sh
sudo systemctl enable zodiac-mount.service
sudo systemctl enable zodiac-umount.service
```

## Server

```sh
mkdir -p /zodiac/{backup,workspace}

sudo ln -sf /zodiac /srv/zodiac              # NFS
sudo ln -sf /zodiac/workspace/$USER ~/zodiac # Home -> Zodiac
```

### Environment

```sh
sudo blkid

sudo vim /etc/environment
```

```sh
# /etc/environment
KEY_HOST=__HOSTNAME__
KEY_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ZODIAC_UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

### NFS configuration

[cf. NFS server configuration](12-nfs.md)

### Scripts and services

- [cf. `/etc/systemd/system/zodiac-open.service`](base/etc/systemd/system/zodiac-open.service)
- [cf. `/etc/systemd/system/zodiac-close.service`](base/etc/systemd/system/zodiac-close.service)
- [cf. `/usr/local/bin/zodiac-open`](base/usr/local/bin/zodiac-open)
- [cf. `/usr/local/bin/zodiac-close`](base/usr/local/bin/zodiac-close)
- [cf. `/usr/local/bin/zodiac-save`](base/usr/local/bin/zodiac-save)

```sh
sudo systemctl enable zodiac-open.service
sudo systemctl enable zodiac-close.service
```
