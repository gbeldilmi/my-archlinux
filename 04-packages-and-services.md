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

## GPU drivers

```sh
pacman -Syy mesa vulkan-intel intel-gpu-tools
```

## Additional packages

Install all additional packages with `pacman -S [packages]` :

- `btop`
- `gzip`
- `htop`
- `neofetch`
- `pigz`
- `pixz`
- `tar`
- `tree`
- `wget`

## Additional features

Show system information when logging in.

```sh
echo "neofetch" >> /etc/profile
```

## Development tools

- `git`
- `jdk-openjdk`
- `lua`
- `nmap`
- `python`
- `ruby`
- `rust`

## Desktop applications

- `desmume`
- `discord`
- `firefox-developer-edition`
- `github-desktop` (AUR)
- `libreoffice-fresh`
- `rawtherapee`
- `spotify` (AUR)
- `visual-studio-code-bin` (AUR)
