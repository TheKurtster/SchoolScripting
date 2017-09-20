#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "ERROR: TOO MANY OR TOO FEW ARGUMENTS SUPPLIED."
    echo "Correct usage: ./interface_edit.sh vi ens33"
    exit 1
fi

exec "$1" /etc/sysconfig/network-scripts/ifcfg-"$2"