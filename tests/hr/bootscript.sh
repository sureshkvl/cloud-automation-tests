#!/bin/bash
echo $'auto eth1\niface eth1 inet dhcp' | sudo tee /etc/network/interfaces.d/eth1.cfg > /dev/null
sudo ifup eth1
echo $'auto eth2\niface eth2 inet dhcp' | sudo tee /etc/network/interfaces.d/eth2.cfg > /dev/null
sudo ifup eth2
sudo sysctl net.ipv4.ip_forward net.ipv4.ip_forward=1
