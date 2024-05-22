# NFS 

## Server

```sh
pacman -S nfs-utils

ln -sf /shared /srv/shared

vim /etc/exports # /srv/shared  10.128.0.2(rw,sync,anonuid=65534,anongid=65534,no_subtree_check,crossmnt,nohide)

vim /etc/hosts.allow # ALL: 10.128.0.*
vim /etc/hosts.deny # ALL: ALL

systemctl enable nfs-server.service
exportfs -arv
```

## Client

```sh
pacman -S nfs-utils

mkdir -p /shared
mount.nfs host:/srv/shared /shared
```

Eventually, add the `mount.nfs` command to a systemd service file (e.g. `/etc/systemd/system/shared-nfs.service`). And enable it with `systemctl enable shared-nfs.service`.
