# Packages and services

## Main packages and services

```sh
pacman -Syy syslog-ng cronie ntp openssh

vim /etc/systemd/journald.conf # #ForwardToSyslog=no -> ForwardToSyslog=yes
vim /etc/ssh/sshd_config # AllowUsers user

systemctl enable syslog-ng@default
systemctl enable cronie
systemctl enable ntpd
systemctl enable sshd
```

## Additional packages

Install all additional packages with ` <packages>` :

```sh
pacman -S gzip {b,h}top neofetch parallel pi{g,x}z tar tree wget

echo "neofetch" >> /etc/profile # Show system information when logging in.
```

- GPU drivers :

```
mesa vulkan-intel intel-gpu-tools
```

- Development tools :

```
git jdk-openjdk lua nmap python ruby rust
```

- Desktop applications :

```
desmume discord firefox libreoffice-fresh rawtherapee zed
```

### AUR packages

- [`github-desktop`](https://aur.archlinux.org/github-desktop.git)
- [`spotify`](https://aur.archlinux.org/spotify.git)
- [`visual-studio-code-bin`](https://aur.archlinux.org/visual-studio-code-bin.git)

```sh
git clone <url>
cd <package>
makepkg -sri
```
