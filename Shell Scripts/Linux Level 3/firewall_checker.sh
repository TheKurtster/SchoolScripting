#!/bin/bash

echo "Checking to see if the Firewall and SELinux are currently disabled..."
echo

FirewallChecker=$(systemctl is-enabled firewalld)
echo "The firewall is currently $FirewallChecker."


if [ "$FirewallChecker" = "enabled" ]; then
	until [ "$FirewallDisabler" = "Y" -o "$FirewallDisabler" = "y" -o "$FirewallDisabler" = "N" -o "$FirewallDisabler" = "n" ]
	do
        	read -p "Do you want to disable the firewall? [Y/N] " FirewallDisabler
	done

	case "$FirewallDisabler" in 
 	 y|Y )
	  	systemctl stop firewalld 
		systemctl disable firewalld
		FirewallChecker=$(systemctl is-enabled firewalld)
		echo "The firewall is now $FirewallChecker."
		;;
 	 n|N ) 
		echo "Leaving firewall enabled."
		;;
	esac
fi

SELinuxFile=$(cat /etc/sysconfig/selinux | grep ^SELINUX=enforcing)

if [ "$SELinuxFile" = "SELINUX=enforcing" ]; then
	echo "SELinux is currently enabled."
	
	until [ "$SELinuxDisabler" = "Y" -o "$SELinuxDisabler" = "y" -o "$SELinuxDisabler" = "N" -o "$SELinuxEnabler" = "n" ]
	do
		read -p "Do you want to disable SELinux? [Y/N] " SELinuxDisabler
	done
	
	case "$SELinuxDisabler" in
	y|Y )
		sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
		SELinuxStatus=$(cat /etc/sysconfig/selinux | grep ^SELINUX=disabled)
		if [ "$SELinuxStatus" = "SELINUX=disabled" ]; then
			echo "SELinux is currently disabled."
		fi
		;;
	n|N )
		echo "Leaving SELinux enabled."
		;;
	esac
else
	echo "SELinux is currently disabled."
fi

# Proper output if SELinux is disabled when checking in sestatus
# SELinux status:                 disabled