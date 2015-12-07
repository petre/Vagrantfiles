#!/bin/bash
echo "Disabling selinux..."
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
echo "Disabling ipv6..."
sudo echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
sudo echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "Installing tools..."
sudo yum -y install telnet htop vim yum-utils net-tools
sudo yum -y install autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig redhat-rpm-config rpm-build
sudo yum -y install libxml2-devel libxslt-devel
sudo yum -y install python-devel python-virtualenv python-pip
echo "Installing redis"
sudo yum -y install redis
sudo systemctl enable redis.service
sudo systemctl restart redis.service
echo "Installing Mysql"
sudo yum -y install mariadb-server mariadb-devel mariadb-libs
sudo systemctl enable mariadb.service
sudo systemctl restart mariadb.service
##sleep 5
echo "Creating Pootle DB and user"
sudo mysql -uroot -v -e "CREATE DATABASE IF NOT EXISTS pootledb CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"
sudo mysql -uroot -v -e "GRANT ALL PRIVILEGES ON pootledb.* TO pootle@localhost IDENTIFIED BY 'secret';"
sudo mysql -uroot -v -e "FLUSH PRIVILEGES;"
sudo mysql -u root pootledb < /vagrant/provision/pootledb.sql
echo "Installing Pootle..."
pip install --upgrade pip
pip install Pootle
pip install MySQL-python
mkdir -p /root/.pootle/
cp /vagrant/provision/pootle.conf /root/.pootle/
echo "Installing nginx"
sudo yum -y localinstall http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
sudo yum -y install nginx
cp /vagrant/provision/pootle-nginx.conf /etc/nginx/conf.d/
sudo systemctl enable nginx.service
sudo systemctl restart nginx.service
echo "bash /vagrant/start.sh" >> /etc/rc.local
bash /vagrant/start.sh
