#!/bin/bash
sudo rpm -Uvh https://repo.zabbix.com/zabbix/6.2/rhel/9/x86_64/zabbix-release-6.2-3.el9.noarch.rpm
sudo dnf clean all
sudo dnf install zabbix-agent -y
sudo sed -i 's/Server=/Server=10.0.4.26/g' /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/ServerActive=/ServerActive=10.0.4.26/g' /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/Hostname=Zabbix server/#Hostname=/g' /etc/zabbix/zabbix_agentd.conf
v1=$HOSTNAME
echo Hostname=$v1 >> /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent
