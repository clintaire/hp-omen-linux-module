# HP Omen RGB Lighting Control Usage Guide

This guide explains how to control RGB lighting zones on HP Omen laptops using the hp-wmi Linux kernel module. It targets Linux users who own HP Omen laptops and want to customize their keyboard or other RGB zones. We assume you know basic Linux commands like `echo` and `sudo`. If you're new to sysfs, this guide teaches you the essentials.

## Prerequisites

Before you begin, ensure the following:

- The hp-wmi kernel module is loaded.
- The sysfs path `/sys/devices/platform/hp-wmi/rgb_zones` exists on your system.
- You have sudo privileges to write to sysfs nodes.

If the path does not exist, check your kernel module installation and hardware compatibility.

## Setting RGB Colors

Set the RGB color for each zone by writing a 6-digit hex color code (RRGGBB format, without the # symbol) to the corresponding sysfs node.

Follow these steps:

1. Identify the zone number (e.g., zone00, zone01).
2. Choose a hex color code.
3. Run the command: `echo <color> | sudo tee /sys/devices/platform/hp-wmi/rgb_zones/<zone>`

### Examples

Set zone00 to red:

```bash
echo FF0000 | sudo tee /sys/devices/platform/hp-wmi/rgb_zones/zone00
```

Set zone01 to blue:

```bash
echo 0000FF | sudo tee /sys/devices/platform/hp-wmi/rgb_zones/zone01
```

Set zone02 to green:

```bash
echo 00FF00 | sudo tee /sys/devices/platform/hp-wmi/rgb_zones/zone02
```

Set zone03 to white (warm):

```bash
echo FFFDD0 | sudo tee /sys/devices/platform/hp-wmi/rgb_zones/zone03
```

## Color Format and References

- Specify colors in RRGGBB hex format.
- Here are some common color codes:
  - Red: FF0000
  - Green: 00FF00
  - Blue: 0000FF
  - White (warm): FFFDD0

## Troubleshooting

- If a command fails, verify the sysfs path exists.
- Confirm the kernel module loads correctly.
- Check your hardware supports RGB control.

For more details, refer to the main [README.md](README.md).

Copyright (c) 2025 Clint Aire. All Rights Reserved.
Modified for personal use.
