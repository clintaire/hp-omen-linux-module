# HP Omen Special Feature Control for Linux

This is a version of the hp-wmi kernel module that implements some features of HP Omen Command Centre.

**Warning: This is experimental and could crash your machine. Use at your own risk.**

## Quick Start

After installation (see below), set keyboard colors like this:

- Single zone:

  ```bash
  sudo bash -c 'echo RRGGBB > /sys/devices/platform/hp-wmi/rgb_zones/zoneXX'
  ```

  - Replace `RRGGBB` with a hex color (e.g., `FF0000` for red).
  - Replace `XX` with zone number (00-03).

- All zones same color:

  ```bash
  for i in {00..03}; do sudo bash -c "echo RRGGBB > /sys/devices/platform/hp-wmi/rgb_zones/zone$i"; done
  ```

Example: Set all zones to blue:

```bash
for i in {00..03}; do sudo bash -c "echo 0000FF > /sys/devices/platform/hp-wmi/rgb_zones/zone$i"; done
```

## Prerequisites

- Disable Secure Boot in UEFI (press F10 during boot).
- Use latest Linux kernel (6.2+ recommended, avoid linux-lts).
- Compatible with HP Omen laptops with RGB keyboards (e.g., HP Omen 16-c0140AX).

Supported features:
- Four-zone keyboard color control
- Omen hotkeys

## Installation

1. Install DKMS and kernel headers (if not present).
2. Run:

   ```bash
   sudo make install
   ```

3. Reboot to load the module.

DKMS handles kernel updates automatically.

## Detailed Usage

### Zones

The module creates `/sys/devices/platform/hp-wmi/rgb_zones/zone00` to `zone03`.

### Setting Colors

Write hex RGB values (e.g., `FF0000` for red) to zone files.

- Zone 0 only:

  ```bash
  sudo bash -c 'echo FF0000 > /sys/devices/platform/hp-wmi/rgb_zones/zone00'
  ```

- All zones:

  ```bash
  for i in {00..03}; do sudo bash -c "echo FF0000 > /sys/devices/platform/hp-wmi/rgb_zones/zone$i"; done
  ```

### Reading Colors

```bash
cat /sys/devices/platform/hp-wmi/rgb_zones/zone00
```

Output: `red: 255, green: 0, blue: 0`

### Hotkeys

Hotkeys map to X11 keysyms. Configure via your desktop's hotkey settings.

## Color Examples

Common colors (all zones):

- Red:

  ```bash
  for i in {00..03}; do sudo bash -c "echo FF0000 > /sys/devices/platform/hp-wmi/rgb_zones/zone$i"; done
  ```

- Green:

  ```bash
  for i in {00..03}; do sudo bash -c "echo 00FF00 > /sys/devices/platform/hp-wmi/rgb_zones/zone$i"; done
  ```

- Blue:

  ```bash
  for i in {00..03}; do sudo bash -c "echo 0000FF > /sys/devices/platform/hp-wmi/rgb_zones/zone$i"; done
  ```

- Off:

  ```bash
  for i in {00..03}; do sudo bash -c "echo 000000 > /sys/devices/platform/hp-wmi/rgb_zones/zone$i"; done
  ```

Rainbow (different per zone):

```bash
sudo bash -c 'echo FF0000 > /sys/devices/platform/hp-wmi/rgb_zones/zone00 && echo 00FF00 > /sys/devices/platform/hp-wmi/rgb_zones/zone01 && echo 0000FF > /sys/devices/platform/hp-wmi/rgb_zones/zone02 && echo FFFF00 > /sys/devices/platform/hp-wmi/rgb_zones/zone03'
```

RGB supports 16M+ colors. Use hex like `FFA500` (orange). Find codes online.

## TODO

- [ ] Brightness control
- [ ] Fan control
