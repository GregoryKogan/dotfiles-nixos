# dotfiles-nixos

[![Hits-of-Code](https://hitsofcode.com/github/GregoryKogan/dotfiles-nixos?branch=main)](https://hitsofcode.com/github/GregoryKogan/dotfiles-nixos/view?branch=main)

## Installation

**1. Install `git`**

Open default NixOS config file and add `git` to `packages`

```shell
sudo nano /etc/nixos/configuration.nix
```

**2. Download configs**

```shell
git clone https://github.com/GregoryKogan/dotfiles-nixos.git ~/nixos
```

**3. Rebuild the system**

Availabe `<host>` options:
  - `vm` - UTM virtual machine

```shell
sudo nixos-rebuild switch --impure --flake ~/nixos#<host>
```

### Troubleshooting

**Magic commands that sometimes fix weird errors**

Collect garbage

```shell
nix-collect-garbage -d
```

Repair nix-store files (should be run as sudo)

```shell
nix-store --verify --check-contents --repair
```
