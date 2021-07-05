#!/bin/bash

function print_help()
{
    echo "Set up the static ip and net cable direct link:"
    echo "  -p {ip}             Static ip of this device."
    echo "  -g {gateway}        IP of gateway, is 192.168.1.1 by default."
    echo "  -m {mask}           Network mask, is 255.255.255.0 by default."
    echo "  -d {device}         Network interface to bind static ip, is eth0 by default."
}

if [ $# -eq 0 ]
then
    print_help
    exit 1
fi

ip=""
gateway="192.168.1.1"
device="eth0"
mask="255.255.255.0"

while getopts ":p:g:d:m:" option
do
    case ${option} in
        p)
            ip=${OPTARG};;
        g)
            gateway=${OPTARG};;
        d)
            device=${OPTARG};;
        m)
            mask=${OPTARG};;
        *)
            echo "Unknown argument(s) encountered."
            exit 1;;
    esac
done

if [ -z ${ip} ]
then
    echo "No IP adress given."
    exit 1
fi

# Backup original interfaces file.
cp /etc/network/interfaces /etc/network/interfaces.backup

# Overwrite new interfaces file.
cat > /etc/network/interfaces << EOF
auto ${device}
iface ${device} inet static
address ${ip}
netmask ${mask}
gateway ${gateway}
EOF