# Git

```sh
pacman -S git

git config --global init.defaultBranch dev
git config --global user.name user
git config --global user.email ""
git config --global core.editor vim
git config --global core.eol lf
git config --global core.autocrlf input

sudo git config --system receive.fsckObjects true
```

## Server

```sh
ln -sf /git /srv/git

git init --bare /srv/git/repo.git
# on client : git clone user@host:/srv/git/repo.git
```
