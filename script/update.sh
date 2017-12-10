#!/bin/bash -eux

if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then
    echo "==> Applying updates"
    yum -y update
    yum -y install unzip python-httplib2 socat rsync bash-completion

   if [[ $DOCKER  =~ true || $DOCKER =~ 1 || $DOCKER =~ yes ]]; then
       echo "==> Installing Docker"
cat <<EOF >> /etc/yum.repos.d/docker.repo
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
       yum -y install docker-engine-17.03.1.ce-1.el7.centos
   fi

    # reboot
    echo "Rebooting the machine..."
    reboot
    sleep 60
fi
