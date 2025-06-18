#!/bin/bash

clear
echo -e "\e[1;35m"
echo "======================================="
echo "           Termux Setup Tool           "
echo "         Created by anbuinfosec        "
echo "          (Mohammad Alamin)            "
echo "======================================="
echo -e "\e[0m"

INSTALL_ALL=false
if [[ "$1" == "--all" ]]; then
  INSTALL_ALL=true
fi

update_termux() {
  echo -e "\e[1;32m[+] Updating Termux...\e[0m"
  pkg update -y && pkg upgrade -y
}

install_group() {
  local description="$1"
  shift
  if $INSTALL_ALL; then
    echo -e "\e[1;34m[Installing] $description...\e[0m"
    pkg install -y "$@"
  else
    read -p "[?] Install $description? (y/n): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
      echo -e "\e[1;34m[Installing] $description...\e[0m"
      pkg install -y "$@"
    else
      echo -e "\e[1;33m[Skipped] $description\e[0m"
    fi
  fi
}

update_termux

install_group "Essential packages" git curl wget unzip zip tar nano vim neofetch
install_group "Development tools" clang make cmake build-essential python nodejs
install_group "Network & security tools" nmap net-tools tsu dnsutils openssh
install_group "Python & pip environment" python python-pip
pip install --upgrade pip
install_group "Linux utilities" htop tree proot termux-api
install_group "Web tools" php apache2
install_group "Optional hacking tools" hydra sqlmap metasploit
install_group "Fun tools" toilet cowsay lolcat

echo -e "\n\e[1;36m[•] Requesting storage permission...\e[0m"
termux-setup-storage

echo -e "\n\e[1;32m[✓] Setup complete. Happy hacking, anbuinfosec!\e[0m"
