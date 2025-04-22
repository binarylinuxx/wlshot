# wlshot
Simple screenshot utility for every possible wlr window manager or Desktop environment
------------------------------------------------------------------------------------------
## Desc
--------
I'm tired of using and combining grim and slurp, so I created my own script
that allows you to use one simple command.
> ⚠ **WARNING:** This utility is currently in **PRE-PRE-PRE-PRE-ALPHA**.
> Use it at your own risk and fear! The author takes no responsibility for any issues or damage caused.

## Example options and usage:
------------------------------------------------------------------------------------------
First time it might look not easy to use but it's veeery simple:
```
wlshot [screen|region] wlrclipboard=[1|0]
```
If you choose screen it captures the screen output if region it captures a selected space on
screen. About wlrclipboard: if you set that as 0 value it saves the screenshot as .png file;
if you set value as 1 it autocopies to clipboard.

You can use:
```
-h or --help
```
as flag to get help message.

# Installation Options

## Prerequisites
If you want compile from SRC in your best interest have installed:
- grim # To make screenshot
- slurp # Choice selected space on screen
- wl-clipboard # Copy to clipboard

## Traditional Install
```
1) git clone https://github.com/binarylinuxx/wlshot.git
2) cd wlshot/
3) sudo make install
```
To uninstall: `sudo make uninstall`

## Nix/NixOS Install
You can install wlshot using the provided flake:

### Temporary Use
```
nix run github:binarylinuxx/wlshot
```

### System-wide Installation (NixOS)
Add to your system configuration:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wlshot.url = "github:binarylinuxx/wlshot";
  };

  outputs = { self, nixpkgs, wlshot, ... }: {
    nixosConfigurations.yourhostname = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          environment.systemPackages = [ wlshot.packages.x86_64-linux.default ];
        }
      ];
    };
  };
}
```

### Home Manager Installation
Add to your Home Manager configuration:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wlshot.url = "github:binarylinuxx/wlshot";
    home-manager.url = "github:nix-community/home-manager";
  };
  
  outputs = { self, nixpkgs, wlshot, home-manager, ... }: {
    homeConfigurations.yourusername = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        {
          home.packages = [ wlshot.packages.x86_64-linux.default ];
        }
      ];
    };
  };
}
```

## Package Managers
- Void Linux: Available in the void-packages repository or install from releases:
  ```
  sudo xbps-install -R ~/Downloads/ wlshot
  ```
  (Works only for Void and xbps-based distributions)

- Arch Linux: Maintained by [Iwnuply](https://github.com/IwnuplyNotTyan)

# About Sources
You can use precompiled binary packages or compile with make if you want the new version as fast as possible.
For stable versions, download the latest xbps package from GitHub releases.

Issues are open for reports and suggestions. Don't feel shy if you have a problem or suggestion!

# Maintainers
- Void Linux Package: [binarylinuxx](https://github.com/binarylinuxx)
- Arch Linux package: [Iwnuply](https://github.com/IwnuplyNotTyan)
- Nix Flake: [binarylinuxx](https://github.com/binarylinuxx)
