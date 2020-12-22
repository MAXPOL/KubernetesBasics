#!/bin/bash
yum install epel-release nano -y
yum install docker -y
systemctl enable docker
cp k8s.repo /etc/yum.repos.d/
yum install kubeadm kubectl kubelet -y
systemctl enable kubelet
sed -i "s|SELINUX=enforcing|SELINUX=disabled|" /etc/selinux/config
reboot
