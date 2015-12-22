#!/bin/bash
echo "Disabling selinux..."
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
echo "Disabling ipv6..."
sudo echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
sudo echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "Installing tools..."
sudo yum -y install telnet htop vim yum-utils net-tools
echo "Fix the LC_CTYPE warning"
echo 'LC_CTYPE="en_US.UTF-8"' >> /etc/sysconfig/i18n
