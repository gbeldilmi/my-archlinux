# Get started

## Set the keyboard layout

```sh
loadkeys fr
```

## Connect to the internet

Connect to a wifi network if necessary with `iwctl`.

```sh
timedatectl set-ntp true
```

## Configure via ssh

```sh
ip a
passwd
```

Connect to host via ssh with `ssh root@<ip>`.
