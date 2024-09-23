# Configure network

## With NetworkManager

```sh
pacman -S networkmanager
systemctl enable NetworkManager
```

### Wireless network via command line

```sh
nmcli device wifi list
nmcli device wifi connect <SSID> password <password>
```

## With systemd-networkd

```sh
systemctl enable systemd-networkd
systemctl enable systemd-resolved
```

### Wireless network

```sh
pacman -S iwd
systemctl enable iwd
```

Later, on post-installation, connect to a wifi network with `iwctl`.

- [cf. `/etc/systemd/network/20-wlan0.network`](base/etc/systemd/network/20-wlan0.network)

### Network bonding

- [cf. `/etc/systemd/network/30-bond0.netdev`](base/etc/systemd/network/30-bond0.netdev)
- [cf. `/etc/systemd/network/30-bond0.network`](base/etc/systemd/network/30-bond0.network)
- [cf. `/etc/systemd/network/30-enp6-bond0.network`](base/etc/systemd/network/30-enp6-bond0.network)


## `hosts` file

- [cf. `/etc/hosts`](base/etc/hosts)
