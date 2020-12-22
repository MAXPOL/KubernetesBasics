#!/bin/bash
echo "192.168.0.4 wsone.local" > /etc/hosts # Change IP address on ip addres your master 
echo "192.168.0.5 master.local" > /etc/hosts # Change IP address on ip addres your master 
echo "192.168.0.6 wstwo.local" > /etc/hosts # Change IP address on ip addres your master 
swapoff -a
kubeadm init --apiserver-advertise-address=192.168.0.5 --pod-network-cidr=10.244.0.0/16 >> /kubeadminstallinfo.data# Change IP address on ip addres your master 
echo "user    ALL=(ALL)       ALL" > /etc/sudoers
su user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
#kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
