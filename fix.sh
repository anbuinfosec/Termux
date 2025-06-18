#!/bin/bash

GREEN='\033[0;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${CYAN}╔══════════════════════════════════════════════════════╗"
echo -e "${CYAN}║              Termux Root Fix Tool                    ║"
echo -e "${CYAN}║              Developer: @anbuinfosec                 ║"
echo -e "${CYAN}╚══════════════════════════════════════════════════════╝${NC}"
echo

echo -e "${YELLOW}[1/4] Removing conflicting 'tsu' package...${NC}"
pkg uninstall tsu -y > /dev/null 2>&1
echo -e "${GREEN}✓ Done${NC}"

echo -e "${YELLOW}[2/4] Updating and upgrading packages...${NC}"
pkg update -y > /dev/null 2>&1 && pkg upgrade -y > /dev/null 2>&1
echo -e "${GREEN}✓ Done${NC}"

echo -e "${YELLOW}[3/4] Installing 'sudo' package...${NC}"
pkg install sudo -y > /dev/null 2>&1
echo -e "${GREEN}✓ Done${NC}"

echo -e "${YELLOW}[4/4] Retesting root access with 'sudo su'...${NC}"
sudo su
