#!/bin/bash

for i in $1*
do
echo -e "\n$i\n============"
ssh $i "cd /; sudo tar -zcf ~/configs.tgz /etc/frr/frr.conf /etc/frr/daemons /etc/network/interfaces /etc/resolv.conf; sudo chown cumulus ~/configs.tgz"
cd $i
scp $i:configs.tgz .
tar xf configs.tgz
cd ..
echo
done

