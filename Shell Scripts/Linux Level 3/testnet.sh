#!/bin/bash

# TestNet.sh
# Kurt Grosser
# 040861731
# gros0059@algonquinlive.com -- thekurtgrosser@gmail.com
# September 8, 2017
# Shell Script to check parameters of
# VM's Network Connectivity and Security Settings

# Grabbing information about various services and placing them in variables
NetworkStatus=$(systemctl is-enabled network)
NetManagerStatus=$(systemctl is-enabled NetworkManager)
FirewallStatus=$(systemctl is-enabled firewalld)
SELinuxStatus=$(sestatus | grep "^SELinux status:")
clear

echo "Welcome to TestNet"
echo
echo "Verifying Status of Selected Services..."
echo "----------------------------------------"
echo

# Cleanly outputting the status of the variables to the user
echo "NetworkManager is currently $NetManagerStatus."
echo "Network is currently $NetworkStatus."
echo "Firewall Daemon is currently $FirewallStatus."

# Special if statement written to properly output if SELinux is enabled or disabled
if [ "$SELinuxStatus" = "SELinux status:                 enabled" ]; then
    echo "SELinux is currently enabled."
elif [ "$SELinuxStatus" = "SELinux status:                 disabled" ]; then
    echo "SELinux is currently disabled."
fi

echo
echo "Outputting Network Settings of Red and Blue Interfaces..."
echo "---------------------------------------------------------"
echo
# Outputting IP Address of Wireless Card
echo "Blue Network (Internet Connection)"
echo "----------------------------------"
echo "IP Address:"
ip -o addr | grep ens33 | head -1
echo
# Outputting IP Address of Ethernet Adapter
echo "Red Network (Internal Lab Connection)"
echo "-------------------------------------"
echo "IP Address:"
ip -o addr | grep ens34 | head -1
echo
echo "Common Internet Details"
echo "-----------------------"
# Outputting List of DNS Servers
echo "DNS Servers:"
cat /etc/resolv.conf | grep nameserver
echo
# Outputting order of Hostname Resolution
echo "Hostname Resolution Order:"
cat /etc/nsswitch.conf | grep ^hosts
echo
# Outputting contents of the Hosts file
echo "Contents of Hosts File:"
cat /etc/hosts
echo
# Outputting Default Gateway
echo "Default Gateway:"
ip route | grep default
echo

# Testing various types of connectivity between various devices
# IP's are currently listed as 255.255.255.255 until Magic Number is attained.
echo "Testing Connectivity Throught Ping Tests..."
echo "-------------------------------------------"
echo
echo "Ping Between Server and Client"
ping -c 3 172.16.31.67
echo
echo "Ping Between This Server and Lab Partners Server"
ping -c 3 172.16.30.64
echo
echo "Ping Between This Server and The Default Gateway"
ping -c 3 192.168.98.2
echo

# Informing user of EOF
echo "End of TestNet Script."
echo "Goodbye..."