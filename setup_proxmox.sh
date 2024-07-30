#!/bin/bash

# Function to display the menu
show_menu() {
    echo "Choose an option:"
    echo "1. Proxmox VE Post Install Setup"
    echo "2. All LXC Templates Setup"
    echo "3. TurnKey LXC Appliances Setup"
    echo "4. File Browser Installation/Uninstallation"
    echo "5. Exit"
}

# Function for Proxmox VE Post Install Setup
post_install_setup() {
    echo "Running Proxmox VE Post Install Setup..."
    bash -c "$(curl -fsSL https://github.com/tteck/Proxmox/raw/main/misc/post-pve-install.sh)"
}

# Function for All LXC Templates Setup
all_templates_setup() {
    echo "Creating LXC Templates..."
    bash -c "$(curl -fsSL https://github.com/tteck/Proxmox/raw/main/misc/all-templates.sh)"
    echo "LXC Template created with default settings: 2GB RAM, 8GB Storage, 2vCPU, onboot 0, DHCP, Unprivileged."
}

# Function for TurnKey LXC Appliances Setup
turnkey_appliances_setup() {
    echo "Creating TurnKey LXC Appliance..."
    bash -c "$(curl -fsSL https://github.com/tteck/Proxmox/raw/main/turnkey/turnkey.sh)"
    echo "TurnKey LXC Appliance created. Password saved in *.creds file."
    echo "Retrieve password using: cat turnkey-name.creds"
}

# Function for File Browser Installation/Uninstallation
file_browser_setup() {
    echo "1. Install File Browser"
    echo "2. Uninstall File Browser"
    echo "3. Update File Browser"
    echo "4. Go Back"

    read -p "Choose an option: " fb_option
    case $fb_option in
        1)
            echo "Installing File Browser..."
            bash -c "$(curl -fsSL https://github.com/tteck/Proxmox/raw/main/misc/filebrowser.sh)"
            echo "File Browser installed. Access it at IP:8080"
            ;;
        2)
            echo "Uninstalling File Browser..."
            bash -c "$(curl -fsSL https://github.com/tteck/Proxmox/raw/main/misc/filebrowser.sh)"
            echo "File Browser uninstalled."
            ;;
        3)
            echo "Updating File Browser..."
            curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
            echo "File Browser updated."
            ;;
        4)
            return
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
}

# Main script loop
while true; do
    show_menu
    read -p "Choose an option: " option
    case $option in
        1)
            post_install_setup
            ;;
        2)
            all_templates_setup
            ;;
        3)
            turnkey_appliances_setup
            ;;
        4)
            file_browser_setup
            ;;
        5)
            echo "Exiting script."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
