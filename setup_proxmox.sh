#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to display the main menu
show_menu() {
    echo -e "${BLUE}\nChoose an option:${NC}"
    echo -e "${YELLOW}1.${NC} Proxmox VE Post Install Setup"
    echo -e "${YELLOW}2.${NC} All LXC Templates Setup"
    echo -e "${YELLOW}3.${NC} TurnKey LXC Appliances Setup"
    echo -e "${YELLOW}4.${NC} File Browser Installation/Uninstallation"
    echo -e "${YELLOW}5.${NC} LXC Containers Management"
    echo -e "${YELLOW}6.${NC} Download and Setup TrueNAS SCALE"
    echo -e "${YELLOW}7.${NC} Exit"
}

# Function for Proxmox VE Post Install Setup
post_install_setup() {
    echo -e "${GREEN}Running Proxmox VE Post Install Setup...${NC}"
    bash -c "$(curl -fsSL https://github.com/tteck/Proxmox/raw/main/misc/post-pve-install.sh)"
    echo -e "${GREEN}Proxmox VE Post Install Setup completed.${NC}"
}

# Function for All LXC Templates Setup
all_templates_setup() {
    echo -e "${GREEN}Creating LXC Templates...${NC}"
    bash -c "$(curl -fsSL https://github.com/tteck/Proxmox/raw/main/misc/all-templates.sh)"
    echo -e "${GREEN}LXC Templates setup completed with default settings: 2GB RAM, 8GB Storage, 2vCPU, onboot 0, DHCP, Unprivileged.${NC}"
}

# Function for TurnKey LXC Appliances Setup
turnkey_appliances_setup() {
    echo -e "${GREEN}Creating TurnKey LXC Appliance...${NC}"
    bash -c "$(curl -fsSL https://github.com/tteck/Proxmox/raw/main/turnkey/turnkey.sh)"
    echo -e "${GREEN}TurnKey LXC Appliance created. Password saved in *.creds file.${NC}"
    echo -e "${YELLOW}Retrieve password using: cat turnkey-name.creds${NC}"
}

# Function for File Browser Installation/Uninstallation
file_browser_setup() {
    echo -e "${BLUE}\n1. Install File Browser"
    echo -e "2. Uninstall File Browser"
    echo -e "3. Update File Browser"
    echo -e "4. Go Back${NC}"

    read -p "Choose an option: " fb_option
    case $fb_option in
        1)
            echo -e "${GREEN}Installing File Browser...${NC}"
            bash -c "$(curl -fsSL https://github.com/tteck/Proxmox/raw/main/misc/filebrowser.sh)"
            echo -e "${GREEN}File Browser installed. Access it at http://IP:8080${NC}"
            ;;
        2)
            echo -e "${RED}Uninstalling File Browser...${NC}"
            bash -c "$(curl -fsSL https://github.com/tteck/Proxmox/raw/main/misc/filebrowser.sh)"
            echo -e "${RED}File Browser uninstalled.${NC}"
            ;;
        3)
            echo -e "${YELLOW}Updating File Browser...${NC}"
            curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
            echo -e "${YELLOW}File Browser updated.${NC}"
            ;;
        4)
            return
            ;;
        *)
            echo -e "${RED}Invalid option. Please try again.${NC}"
            ;;
    esac
}

# Function for LXC Containers Management
lxc_containers_setup() {
    echo -e "${CYAN}\nLXC Containers Management Menu:${NC}"
    echo -e "${MAGENTA}1.${NC} Home Assistant Container LXC"
    echo -e "${MAGENTA}2.${NC} Podman Home Assistant Container LXC"
    echo -e "${MAGENTA}3.${NC} Plex Media Server LXC"
    echo -e "${MAGENTA}4.${NC} Jellyfin Media Server LXC"
    echo -e "${MAGENTA}5.${NC} Jellyseerr LXC"
    echo -e "${MAGENTA}6.${NC} Nextcloud LXC"
    echo -e "${MAGENTA}7.${NC} Alpine Nextcloud Hub LXC"
    echo -e "${MAGENTA}8.${NC} TurnKey Nextcloud LXC"
    echo -e "${MAGENTA}9.${NC} Go Back"

    read -p "Choose an option: " lxc_option
    case $lxc_option in
        1)
            echo -e "${GREEN}Creating Home Assistant Container LXC...${NC}"
            echo -e "${YELLOW}Command:${NC}"
            echo -e "${GREEN}bash -c \"\$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/homeassistant.sh)\"${NC}"
            echo -e "${GREEN}⚡ Default Settings: 2GB RAM - 16GB Storage - 2vCPU ⚡${NC}"
            echo -e "${GREEN}Home Assistant Interface: http://IP:8123${NC}"
            echo -e "${GREEN}Portainer Interface: https://IP:9443${NC}"
            echo -e "${GREEN}Path to HA /config: /var/lib/docker/volumes/hass_config/_data${NC}"
            ;;
        2)
            echo -e "${GREEN}Creating Podman Home Assistant Container LXC...${NC}"
            echo -e "${YELLOW}Command:${NC}"
            echo -e "${GREEN}bash -c \"\$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/podman-homeassistant.sh)\"${NC}"
            echo -e "${GREEN}⚡ Default Settings: 2GB RAM - 16GB Storage - 2vCPU ⚡${NC}"
            echo -e "${GREEN}Home Assistant Interface: http://IP:8123${NC}"
            echo -e "${GREEN}Path to HA /config: /var/lib/containers/storage/volumes/hass_config/_data${NC}"
            ;;
        3)
            echo -e "${GREEN}Creating Plex Media Server LXC...${NC}"
            echo -e "${YELLOW}Command:${NC}"
            echo -e "${GREEN}bash -c \"\$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/plex.sh)\"${NC}"
            echo -e "${GREEN}⚡ Default Settings: 2GB RAM - 8GB Storage - 2vCPU ⚡${NC}"
            echo -e "${GREEN}Plex Media Server Interface: http://IP:32400/web${NC}"
            ;;
        4)
            echo -e "${GREEN}Creating Jellyfin Media Server LXC...${NC}"
            echo -e "${YELLOW}Command:${NC}"
            echo -e "${GREEN}bash -c \"\$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/jellyfin.sh)\"${NC}"
            echo -e "${GREEN}⚡ Default Settings: 2GB RAM - 8GB Storage - 2vCPU ⚡${NC}"
            echo -e "${GREEN}Jellyfin Media Server Interface: http://IP:8096${NC}"
            echo -e "${GREEN}FFmpeg path: /usr/lib/jellyfin-ffmpeg/ffmpeg${NC}"
            ;;
        5)
            echo -e "${GREEN}Creating Jellyseerr LXC...${NC}"
            echo -e "${YELLOW}Command:${NC}"
            echo -e "${GREEN}bash -c \"\$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/jellyseerr.sh)\"${NC}"
            echo -e "${GREEN}⚡ Default Settings: 2GB RAM - 8GB Storage - 2vCPU ⚡${NC}"
            echo -e "${GREEN}Jellyseerr Interface: http://IP:5055${NC}"
            ;;
        6)
            echo -e "${GREEN}Creating Nextcloud LXC...${NC}"
            echo -e "${YELLOW}Command:${NC}"
            echo -e "${GREEN}bash -c \"\$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/nextcloudpi.sh)\"${NC}"
            echo -e "${GREEN}⚡ Default Settings: 2GB RAM - 8GB Storage - 2vCPU ⚡${NC}"
            echo -e "${GREEN}NextCloudPi Interface: (https)IP/${NC}"
            ;;
        7)
            echo -e "${GREEN}Creating Alpine Nextcloud Hub LXC...${NC}"
            echo -e "${YELLOW}Command:${NC}"
            echo -e "${GREEN}bash -c \"\$(wget -qO - https://github.com/tteck/Proxmox/raw/main/ct/alpine-nextcloud.sh)\"${NC}"
            echo -e "${GREEN}⚡ Default Settings: 1GB RAM - 2GB Storage - 2vCPU ⚡${NC}"
            echo -e "${GREEN}Alpine Nextcloud Hub Interface: (https)IP/${NC}"
            ;;
        8)
            echo -e "${GREEN}Creating TurnKey Nextcloud LXC...${NC}"
            echo -e "${YELLOW}Command:${NC}"
            echo -e "${GREEN}bash -c \"\$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/turnkey/turnkey.sh)\"${NC}"
            echo -e "${GREEN}TurnKey Nextcloud Interface: (https)IP/${NC}"
            ;;
        9)
            return
            ;;
        *)
            echo -e "${RED}Invalid option. Please try again.${NC}"
            ;;
    esac
}

# Function for TrueNAS SCALE download and setup
truenas_setup() {
    echo -e "${CYAN}\nDownloading TrueNAS SCALE...${NC}"
    read -p "This will download TrueNAS SCALE. Are you sure you want to continue? (y/n): " confirm
    if [[ $confirm != [yY] ]]; then
        echo -e "${RED}Download cancelled.${NC}"
        return
    fi

    echo -e "${GREEN}Downloading TrueNAS SCALE ISO...${NC}"
    wget -q https://download.sys.truenas.net/TrueNAS-SCALE-Dragonfish/24.04.2/TrueNAS-SCALE-24.04.2.iso

    echo -e "${GREEN}TrueNAS SCALE ISO downloaded.${NC}"

    # Setup options
    echo -e "${CYAN}\nEnter the following setup options:${NC}"
    read -p "Enter amount of RAM (e.g., 2G): " ram
    read -p "Enter amount of boot storage (e.g., 20G): " storage
    read -p "Enter number of CPU cores: " cpu

    echo -e "${YELLOW}\nIOMMU Support Check:${NC}"
    if dmesg | grep -qi iommu; then
        echo -e "${GREEN}IOMMU is enabled.${NC}"
        read -p "Do you want to enable GPU support? (y/n): " gpu_support
        if [[ $gpu_support == [yY] ]]; then
            echo -e "${GREEN}GPU support will be enabled.${NC}"
        else
            echo -e "${RED}GPU support will not be enabled.${NC}"
        fi
    else
        echo -e "${RED}IOMMU is not enabled. Please enable it in the BIOS/UEFI settings if you want to add GPU support.${NC}"
    fi

    echo -e "${GREEN}TrueNAS SCALE setup options configured:${NC}"
    echo -e "${GREEN}RAM: $ram${NC}"
    echo -e "${GREEN}Boot Storage: $storage${NC}"
    echo -e "${GREEN}CPU Cores: $cpu${NC}"
    echo -e "${GREEN}GPU Support: ${gpu_support:-No}${NC}"
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
            lxc_containers_setup
            ;;
        6)
            truenas_setup
            ;;
        7)
            echo -e "${BLUE}Exiting script.${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Please try again.${NC}"
            ;;
    esac
done
