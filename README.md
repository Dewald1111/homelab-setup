# Homelab Setup

This repository provides scripts for setting up and managing a Proxmox VE homelab environment. It includes options for configuring Proxmox VE, managing LXC templates, deploying TurnKey appliances, and installing File Browser.

## Features

- **Proxmox VE Post Install Setup:** Configures Proxmox repositories, disables subscription nag, and updates Proxmox VE.
- **LXC Templates Setup:** Creates LXC templates with default settings.
- **TurnKey LXC Appliances:** Creates TurnKey LXC appliances with credentials management.
- **File Browser:** Installs, uninstalls, or updates File Browser in an LXC container.

## Usage

To execute the setup script directly from GitHub, use the following command:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Dewald1111/homelab-setup/main/setup_proxmox.sh)"
