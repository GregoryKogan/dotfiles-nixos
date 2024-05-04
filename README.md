# dotfiles-nixos

## Installation

**1. Enter nix-shell with `git`**

```shell
nix-shell -p git
```

**2. Download configs**

```shell
git clone https://github.com/GregoryKogan/dotfiles-nixos.git nixos
```

**3. Rebuild the system**

Availabe `<host>` options:
  - `vm`

```shell
sudo nixos-rebuild switch --impure --flake ~/nixos#<host>
```

After this the system might freeze. Just wait a few minutes and reboot.
