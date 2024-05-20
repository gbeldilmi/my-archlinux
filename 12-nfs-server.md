# NFS server

```sh
pacman -S nfs-utils

ln -sf /shared /srv/shared

vim /etc/exports # /srv/shared  10.128.0.2(rw,sync,anonuid=65534,anongid=65534,no_subtree_check,crossmnt,nohide)

vim /etc/hosts.allow # ALL: 10.128.0.*
vim /etc/hosts.deny # ALL: ALL

systemctl enable nfs-server.service
exportfs -arv
```
