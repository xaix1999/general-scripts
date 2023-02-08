#!/bin/bash
UPDATESTRING="All packages are up to date."
UPDATEQ=`sudo sh -c 'apt update -y 2>/dev/null | grep packages'`
#
UPDATE1()
{
if [ "${UPDATEQ}" = "${UPDATESTRING}" ]; then
echo "All packages are up to date."
else
sudo apt upgrade -y &>/dev/null
echo "20% Complete"
sudo apt dist-upgrade -y &>/dev/null
echo "40% Complete"
sudo apt autoremove -y &>/dev/null
echo "60% Complete"
sudo apt autopurge -y &>/dev/null
echo "80% Complete"
pihole -up &>/dev/null
echo "All updates complete."
fi
}
UPDATE1
