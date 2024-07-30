Here’s the updated README file with the correct link for TrueNAS SCALE:

---

# Proxmox VE Setup Script

This repository contains a bash script designed to streamline and automate various setup tasks for Proxmox VE. The script simplifies post-installation configuration, LXC container management, and includes support for downloading and setting up TrueNAS SCALE.

## Features

- **Proxmox VE Post Install Setup**: Automates post-installation tasks for Proxmox VE.
- **LXC Templates Setup**: Creates LXC templates with default settings.
- **TurnKey LXC Appliances Setup**: Sets up TurnKey LXC appliances and provides password management instructions.
- **File Browser Management**: Install, uninstall, and update File Browser.
- **LXC Containers Management**: Provides commands and setup instructions for various LXC containers, including Home Assistant, Plex, Jellyfin, and more.
- **TrueNAS SCALE Setup**: Downloads TrueNAS SCALE ISO and assists with initial configuration including RAM, storage, and CPU settings. Checks for IOMMU support and advises on GPU setup.

## Prerequisites

- Proxmox VE installed and running.
- Basic understanding of Linux and Proxmox VE.
- Internet access for downloading scripts and ISO files.

## Usage

To execute the setup script, use the following command:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Dewald1111/homelab-setup/main/setup_proxmox.sh)"
```

### Menu Options

1. **Proxmox VE Post Install Setup**: Run the Proxmox VE post-installation script.
2. **All LXC Templates Setup**: Create LXC templates with default settings.
3. **TurnKey LXC Appliances Setup**: Setup TurnKey LXC appliances.
4. **File Browser Installation/Uninstallation**: Install, uninstall, or update File Browser.
5. **LXC Containers Management**: Manage various LXC containers (Home Assistant, Plex, Jellyfin, etc.).
6. **Download and Setup TrueNAS SCALE**: Download TrueNAS SCALE ISO and configure initial settings.
7. **Exit**: Exit the script.

### TrueNAS SCALE Setup

1. **Download Confirmation**: The script will prompt you to confirm downloading TrueNAS SCALE.
2. **Setup Options**: Enter RAM, storage, and CPU settings for the TrueNAS SCALE installation.
3. **IOMMU Support**: The script will check if IOMMU is enabled and provide guidance on enabling GPU support if necessary.

## Example Usage

To run the script and access the setup menu:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Dewald1111/homelab-setup/main/setup_proxmox.sh)"
```

1. Follow the on-screen menu to choose the desired setup option.
2. For TrueNAS SCALE, confirm the download, and input the necessary configuration settings.

## Credits and Resources

- **Proxmox VE LXC Templates and Appliances**: [Tteck's Proxmox Setup Guide](https://tteck.github.io/Proxmox/)
- **TrueNAS SCALE**: [TrueNAS SCALE Official Page](https://www.truenas.com/truenas-scale/)
