#!/bin/bash

echo "[TASK 1] Pull required containers"
kubeadm config images pull >/dev/null 2>&1

echo "[TASK 2] Initialize Kubernetes Cluster"
kubeadm init --apiserver-advertise-address=172.16.16.100 --pod-network-cidr=10.244.0.0/16 >> /root/kubeinit.log 2>/dev/null

echo "[TASK 3] Deploy Calico network"
#kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.18/manifests/calico.yaml >/dev/null 2>&1
kubectl --kubeconfig=/etc/kubernetes/admin.conf crate -f https://raw.githubusercontent.com/borland6/build_k8s_env_bare/main/calico.yaml

echo "[TASK 4] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /joincluster.sh 2>/dev/null

echo "[TASK 5] copy kubeconfig file for root user"
sudo mkdir -p /root/.kube
sudo cp -i /etc/kubernetes/admin.conf /root/.kube/config
sudo chown root:root /root/.kube/config

echo "[TASK 6] copy kubeconfig file for vagrant user"
mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf $/home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config
