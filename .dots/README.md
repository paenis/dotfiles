# dotfiles

very bad

configs that can't be put into $HOME can be found under [.dots/conf](/.dots/conf) as if they were in the root directory.

## bootstrapping

(WIP)

from a base Arch install, install paru (or another AUR helper):

```shell
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git && cd paru
makepkg -si
```

clone and install:

```shell
git clone https://github.com/paenis/dotfiles.git && cd dotfiles
paru -S --needed - < .dots/packages.list
# todo: linker
```
