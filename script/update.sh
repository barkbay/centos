#!/bin/bash -eux

if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then
    echo "==> Applying updates"
    yum -y update
    yum -y install unzip python-httplib2 socat rsync bash-completion git epel-release yum-utils

if [[ $DOCKER  =~ true || $DOCKER =~ 1 || $DOCKER =~ yes ]]; then
    echo "==> Installing Docker"
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo  
    yum -y install docker-ce-18.09.0-3.el7.x86_64 libselinux-python device-mapper-libs ebtables
   fi

    # reboot
    echo "Rebooting the machine..."
    reboot
    sleep 60
fi
