# WireGuard

```sh
pacman -S wireguard-tools

wg genkey | sudo tee /etc/wireguard/wg0-private.key | wg pubkey | sudo tee /etc/wireguard/wg0-public.key

sudo vim /etc/wireguard/wg0.conf
```

- [cf. `/etc/wireguard/wg0.conf` (server)](base/etc/wireguard/wg0-server.conf)
- [cf. `/etc/wireguard/wg0.conf` (client)](base/etc/wireguard/wg0-client.conf)

```sh
sudo systemctl start wg-quick@wg0.service
sudo systemctl enable wg-quick@wg0.service
```

